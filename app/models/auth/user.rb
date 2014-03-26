module Auth
  class User < ActiveRecord::Base
    has_many :assignments, dependent: :destroy
    has_many :roles, through: :assignments
    validates :roles, presence: true
    has_many :identities, dependent: :destroy

    before_validation :set_role

    mount_uploader :avatar, Uppr::Image
    store_in_background :avatar

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :lockable, :timeoutable, :omniauthable, :confirmable #, :async

    # Allow acces to ability from user
    # def ability
    #   @ability ||= Ability.new(self)
    # end
    # delegate :can?, :cannot?, to: :ability

    # Return +boolean+ if user has given role
    def has_role? role_sym
      roles.any? { |r| r.name.underscore.to_sym == role_sym }
    end

    # Set default roles
    def set_role 
      self.roles << Role.find_or_create_by(name: 'User') if roles.empty?
    end

    # Rewrite default path with +id+ and +translation.name+
    # This is used as default in +url_for+
    def to_param
      "#{id} #{name}".parameterize
    end

    # Map all emails from user identities
    def emails
      identities.map(&:email).compact
    end

    # Switch xeditable and manage
    def switch what
      case what
      when 'xeditable'
        self.xeditable = xeditable? ? false : true
      when 'manage'
        self.manage = manage? ? false : true
      end
      save
    end

    # Create user from OmniAuth
    def self.from_omniauth auth
      create! email: auth[:info][:email] || "#{auth[:uid]}@#{auth[:provider]}.com", 
              password: Digest::SHA1.hexdigest(rand(36**10).to_s(36)),
              name: auth[:info][:name]
    end
  end
end