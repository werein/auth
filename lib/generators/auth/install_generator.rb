module Auth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Migrate database and seed data to your application."

      def db_migrate
        rake "db:migrate"
      end   

      def append_seed_data
        create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
        append_file 'db/seeds.rb', verbose: true do
          <<-EOH
# Default Auth seed data
Auth::Engine.load_seed
          EOH
        end
      end

      def copy_configuration
        template "auth.yml", "config/auth.yml"
      end

      def seed_data
        rake "db:seed"
      end
    end
  end
end