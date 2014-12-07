require 'omniauth'
require 'omniauth-saml'
require 'yaml'

OKTA_CONFIGS = YAML.load(File.read(File.join(Rails.application.config.root,"config", "okta_saml.yml")))


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :issuer                             => "http://localhost:3000",
    :idp_sso_target_url                 => OKTA_CONFIGS['development']['idp_sso_target_url'],
    :idp_sso_target_url_runtime_params  => {:redirectUrl => :RelayState},
    :idp_cert_fingerprint               => OKTA_CONFIGS['development']['idp_cert_fingerprint'],
    :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
end