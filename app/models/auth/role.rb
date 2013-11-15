module Auth
  class Role < ActiveRecord::Base
    has_many :assignments
    has_many :users, through: :assignments
    
    validates :name, presence: true,
              uniqueness: { case_sensitive: false }
  end
end
