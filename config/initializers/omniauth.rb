OMNIAUTH_CONFIGS = YAML.load(File.read(File.join(Rails.application.config.root,'config', 'omni_auth.yml')))

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           OMNIAUTH_CONFIGS['google_client']['id'],
           OMNIAUTH_CONFIGS['google_client']['secret'],
           {client_options: {ssl: {ca_file: Rails.root.join('cacert.pem').to_s}}}
end