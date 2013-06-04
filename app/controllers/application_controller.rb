class ApplicationController
  layout "translation_rails/application"
  before_filter :get_original_layout

  def self.layout(layout, conditions={})
    unless layout.to_s == "translation_rails/application"
      self.original_layout = layout.to_s
    end
    layout = "translation_rails/application"
    super
  end

  def self.original_layout=(layout)
    @original_layout = layout
  end

  def self.original_layout
    @original_layout || "translation_rails/application"
  end


  def get_original_layout
    @layout_name = self.class.original_layout
  end
end