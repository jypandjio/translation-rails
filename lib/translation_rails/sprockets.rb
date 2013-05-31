require "sprockets"

module Sprockets
  class BundledAsset
    def initialize(environment, logical_path, pathname)
      super(environment, logical_path, pathname)
      @processed_asset = environment.find_asset(pathname, :bundle => false)
      translationcenter_inspector = environment.find_asset("translation_center/inspector.js", :bundle => false)

      @required_assets = @processed_asset.required_assets + translationcenter_inspector.send(:required_assets)
      @dependency_paths = @processed_asset.dependency_paths + translationcenter_inspector.dependency_paths
      # Explode Asset into parts and gather the dependency bodies
      @source = to_a.map { |dependency| dependency.to_s }.join

      # Run bundle processors on concatenated source
      context = environment.context_class.new(environment, logical_path, pathname)
      @source = context.evaluate(pathname, :data => @source,
                  :processors => environment.bundle_processors(content_type))

      @mtime  = (to_a + @dependency_paths).map(&:mtime).max
      @length = Rack::Utils.bytesize(source)
      @digest = environment.digest.update(source).hexdigest
    end
  end
end