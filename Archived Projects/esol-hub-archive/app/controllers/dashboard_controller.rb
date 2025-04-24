# ./app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
    include Secured
    skip_before_action :logged_in_using_omniauth?, only: [:index]

    def index
      # This will render a view in `app/views/dashboard/index.html.erb`
    end

    def show
      # session[:userinfo] was saved earlier on Auth0Controller#callback
      @user = session[:userinfo]
    end
  end