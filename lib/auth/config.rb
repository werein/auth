module Auth
  # Configures global settings for Auth
  module Config
    include ActiveSupport::Configurable
    
    # Twitter OmniAuth
    config_accessor :twitter_key
    config_accessor :twitter_secret

    # Facebook OmniAuth
    config_accessor :facebook_key
    config_accessor :facebook_secret
    
    # Reset all configurations to defaults.
    def self.reset
      file = File.exist?('config/auth.yml') ? 'config/auth.yml' : "#{Engine.root}/lib/generators/templates/auth.yml"
      config = YAML.load_file(file)[Rails.env].deep_symbolize_keys!

      config.each do |key, value|
        send("#{key}=", value)
      end
    end

    # Set default values for configuration options on load
    self.reset
  end
end