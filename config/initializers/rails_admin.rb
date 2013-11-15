# RailsAdmin config file. Generated on October 16, 2013 22:03
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan, RailsAdmin::Ability

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated 

  config.model Auth::Assignment do
    visible false
  end

  config.model Auth::Identity do
    visible false
  end

  config.model Auth::Role do
    navigation_icon 'icon-chevron-right'
    list do
      field :name
      field :created_at
    end
    create do
      field :name
      field :users
    end
    edit do
      field :users
    end
  end

  config.model Auth::User do
    navigation_icon 'icon-user'
    list do 
      field :name
      field :email
      field :avatar
      field :roles
    end
    create do 
      field :name
      field :avatar
      field :email
      field :password
      field :password_confirmation
      field :roles
      field :xeditable
      field :manage
    end
    edit do 
      field :name
      field :avatar
      field :email
      field :password
      field :password_confirmation
      field :roles
      field :xeditable
      field :manage
    end
  end

end if defined? RailsAdmin