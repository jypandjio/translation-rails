Rails.application.paths["db/migrate"] = [File.expand_path("../../../db/migrate", __FILE__), "db/migrate"]

module TranslationCenter
  class ApplicationController < ActionController::Base

    helper_method :current_user

    def authenticate_user!
      if current_user.blank?
        redirect_to "/", :alert => "You must login to access this page."
      end
    end

    def current_user
      @current_user ||=
        if session[:current_user_id].present?
          Manager.find_by_email(TranslationCenter::CONFIG['yaml_translator_identifier'])
        end
    end

  end
end

# class ApplicationController < ActionController::Base
#   layout "translation_rails/application"
#   before_filter :get_original_layout

#   def self.layout(layout, conditions={})
#     unless layout.to_s == "translation_rails/application"
#       self.original_layout = layout.to_s
#     end
#     layout = "translation_rails/application"
#     super
#   end

#   def self.original_layout=(layout)
#     @original_layout = layout
#   end

#   def self.original_layout
#     @original_layout || "translation_rails/application"
#   end


#   def get_original_layout
#     @layout_name = self.class.original_layout
#   end
# end