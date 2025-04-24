# ./config/initializers/auth0.rb
#AUTH0_CONFIG = Rails.application.config_for(:auth0)

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider(
#     :auth0,
#     AUTH0_CONFIG['auth0_client_id'],
#     AUTH0_CONFIG['auth0_client_secret'],
#     AUTH0_CONFIG['auth0_domain'],
#     callback_path: '/auth/auth0/callback',
#     authorize_params: {
#       scope: 'openid profile'
#     }
#   )
# end

AUTH0_CONFIG = {
  'auth0_client_id' => ENV.fetch('AUTH0_CLIENT_ID'),
  'auth0_domain'    => ENV.fetch('AUTH0_DOMAIN'),
  'auth0_client_secret' => ENV.fetch('AUTH0_CLIENT_SECRET')
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch('AUTH0_CLIENT_ID'),
    ENV.fetch('AUTH0_CLIENT_SECRET'),
    ENV.fetch('AUTH0_DOMAIN'),
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid profile email admin'
    }
  )
end