# Seed default roles and default user

%w(User Admin).map{ |n| Auth::Role.find_or_create_by(name: n) }

Auth::User.where(email: "info@imin.cz").first_or_create do |user|
  user.name = "We're in"
  user.email = "info@imin.cz"
  user.roles = [ Auth::Role.find_by(name: 'Admin') ]
  user.password = 'Project28159349'
  user.confirmed_at = Time.zone.now
end