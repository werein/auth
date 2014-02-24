$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auth"
  s.version     = Auth::VERSION
  s.authors     = ["Jiri Kolarik"]
  s.email       = ["jiri.kolarik@imin.cz"]
  s.homepage    = "http://gitlab.imin.cz/project/auth"
  s.summary     = "Auth Engine for Project"
  s.description = "Auth Engine for Project"

  s.files       = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/*.*" ,"test/{cells,controllers,data,helpers,integration,models}/**/*","test/dummy/*.*", "test/dummy/{app,bin,config,db,lib}/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "core", "~> 1.0"
  s.add_dependency "devise", "~> 3.1"
  # s.add_dependency "devise-async", "~> 0.8"
  s.add_dependency "omniauth", "~> 1.1"
  s.add_dependency "omniauth-twitter", "~> 1.0"
  s.add_dependency "omniauth-facebook", "~> 1.4"
  s.add_dependency "cancan", "~> 1.6"
  s.add_dependency "route_translator", "~> 3.1"
  s.add_dependency "meta-tags", "~> 1.5"
end
