# ./app/controllers/auth0_controller.rb
class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env['omniauth.auth']
  
    @user = User.find_or_create_by(auth0_id: auth_info['uid']) do |user|
      user.name  = auth_info['info']['name']
      user.email = auth_info['info']['email']
      user.image = auth_info['info']['image']
    end
  
    session[:user_id] = @user.id
    session[:user_info] = {
      name:  @user.name,
      email: @user.email,
      image: @user.image
    }
  
    redirect_to calendar_path, notice: "Signed in as #{@user.name}"
  end
  


  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG['auth0_client_id']
    }

    URI::HTTPS.build(host: AUTH0_CONFIG['auth0_domain'], path: '/v2/logout', query: request_params.to_query).to_s
  end
