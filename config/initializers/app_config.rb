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