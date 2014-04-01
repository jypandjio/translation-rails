module TranslationRails
  module ControllerExtend
    extend ActiveSupport::Concern

    included do
      layout "translation_rails/application"
      before_filter :get_original_layout
    end

    def get_original_layout
      @layout_name = self.class.original_layout
    end

    module ClassMethods
      def layout(layout, conditions={})
        unless layout.to_s == "translation_rails/application"
          self.original_layout = layout.to_s
        end
        layout = "translation_rails/application"
        super
      end

      def original_layout=(layout)
        @original_layout = layout
      end

      def original_layout
        @original_layout || "translation_rails/application"
      end
    end
  end
end
