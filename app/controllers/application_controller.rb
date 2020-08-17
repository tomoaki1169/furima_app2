class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :ion?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def ion?
    Rails.env.ion?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def configure_permitted_parameters
    added_attrs = [ :name,
                    :email,
                    :password,
                    :password_confirmation,
                  ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

end

