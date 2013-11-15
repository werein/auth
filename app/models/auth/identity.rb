module Auth
  class Identity < ActiveRecord::Base
    belongs_to :user
    validates :user, presence: true

    def self.from_omniauth auth, current_user
      where(auth.slice(:provider, :uid)).first_or_create do |identity|
        identity.provider = auth.fetch(:provider)
        identity.uid = auth.fetch(:uid)
        identity.name = auth[:info][:name]
        identity.email = auth[:info][:email]
        identity.user = current_user ? current_user : User.from_omniauth(auth)
      end
    end
  end
end