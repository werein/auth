require 'core'

require 'decorators'
require 'devise'
require 'omniauth'
require 'omniauth-twitter'
require 'omniauth-facebook'
require 'route_translator'
require 'cancan'
require 'meta_tags'

module Auth
  class Engine < ::Rails::Engine
    isolate_namespace Auth

    config.to_prepare do
      Decorators.register! Engine.root, Rails.root
    end

    initializer :append_views do
      ActionView::Base.send :include, ApplicationHelper
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end