module Secured
    extend ActiveSupport::Concern
  
    included do
      before_action :logged_in_using_omniauth?
      before_action :set_current_user
    end
  
    def logged_in_using_omniauth?
      redirect_to root_path unless session[:userinfo].present?
    end
  
    def set_current_user
      return unless session[:userinfo].present?
  
      email = session[:userinfo]['email']
      @current_user = User.find_by(email: email)
    end
  
    def current_user
      @current_user
    end