require "test_helper"

module Auth
  describe Ability do
    describe 'Anuathorized access' do 
      let(:ability) { Ability.new(nil) }

      describe 'Identities' do 
        it "cannot index identity"         do ability.cannot?(:index, :identities).must_equal true end
        it "cannot create identity"        do ability.cannot?(:create, Identity.new).must_equal true end
        it "cannot show identity"          do ability.cannot?(:show, Identity.new).must_equal true end
        it "cannot edit identity"          do ability.cannot?(:edit, Identity.new).must_equal true end
        it "cannot update identity"        do ability.cannot?(:update, Identity.new).must_equal true end
        it "cannot switch identity"        do ability.cannot?(:switch, Identity.new).must_equal true end
        it "cannot delete identity"        do ability.cannot?(:delete, Identity.new).must_equal true end
      end

      describe 'Roles' do 
        it "cannot index role"         do ability.cannot?(:index, :roles).must_equal true end
        it "cannot create role"        do ability.cannot?(:create, Role.new).must_equal true end
        it "cannot show role"          do ability.cannot?(:show, Role.new).must_equal true end
        it "cannot edit role"          do ability.cannot?(:edit, Role.new).must_equal true end
        it "cannot update role"        do ability.cannot?(:update, Role.new).must_equal true end
        it "cannot delete role"        do ability.cannot?(:delete, Role.new).must_equal true end
      end

      describe 'Users' do 
        it "cannot index user"         do ability.cannot?(:index, :users).must_equal true end
        it "cannot create user"        do ability.cannot?(:create, User.new).must_equal true end
        it "can show user"             do ability.can?(:show, User.new).must_equal true end
        it "cannot edit user"          do ability.cannot?(:edit, User.new).must_equal true end
        it "cannot update user"        do ability.cannot?(:update, User.new).must_equal true end
        it "cannot delete user"        do ability.cannot?(:delete, User.new).must_equal true end
      end

    end

    describe 'User access' do
      let(:user)    { user_ability(:user) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      before do
        current_user.stubs(:id).returns(1)
      end

      describe 'Identities' do 
        it "cannot index identity"         do ability.cannot?(:index, :identities).must_equal true end
        it "cannot create identity"        do ability.cannot?(:create, Identity.new).must_equal true end
        it "cannot show identity"          do ability.cannot?(:show, Identity.new).must_equal true end
        it "cannot edit identity"          do ability.cannot?(:edit, Identity.new).must_equal true end
        it "cannot update identity"        do ability.cannot?(:update, Identity.new).must_equal true end
        it "cannot switch identity"        do ability.cannot?(:switch, Identity.new).must_equal true end
        it "cannot delete identity"        do ability.cannot?(:delete, Identity.new).must_equal true end
      end

      describe 'Roles' do 
        it "cannot index role"         do ability.cannot?(:index, :roles).must_equal true end
        it "cannot create role"        do ability.cannot?(:create, Role.new).must_equal true end
        it "cannot show role"          do ability.cannot?(:show, Role.new).must_equal true end
        it "cannot edit role"          do ability.cannot?(:edit, Role.new).must_equal true end
        it "cannot update role"        do ability.cannot?(:update, Role.new).must_equal true end
        it "cannot delete role"        do ability.cannot?(:delete, Role.new).must_equal true end
      end

      describe 'Users' do 
        it "cannot index user"         do ability.cannot?(:index, :users).must_equal true end
        it "cannot create user"        do ability.cannot?(:create, User.new).must_equal true end
        it "can show user"             do ability.can?(:show, User.new).must_equal true end
        it "cannot edit user"          do ability.cannot?(:edit, User.new).must_equal true end
        it "cannot update user"        do ability.cannot?(:update, User.new).must_equal true end
        it "cannot switch user"        do ability.cannot?(:switch, User.new).must_equal true end
        it "cannot delete user"        do ability.cannot?(:delete, User.new).must_equal true end
      end

      describe 'with users object' do 
        before do 
          User.any_instance.stubs(:id).returns(1)
        end

        describe 'Users' do 
          it "cannot index user"         do ability.cannot?(:index, :users).must_equal true end
          it "cannot create user"        do ability.cannot?(:create, User.new).must_equal true end
          it "can show user"             do ability.can?(:show, User.new).must_equal true end
          it "can edit user"             do ability.can?(:edit, User.new).must_equal true end
          it "can update user"           do ability.can?(:update, User.new).must_equal true end
          it "can switch user"           do ability.can?(:switch, User.new).must_equal true end
          it "cannot delete user"        do ability.cannot?(:delete, User.new).must_equal true end
        end
      end
    end

    describe 'Admin access' do 
      let(:user)    { user_ability(:admin) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      before do
        current_user.stubs(:id).returns(1)
      end

      describe 'Identities' do 
        it "can index identity"         do ability.can?(:index, :identities).must_equal true end
        it "can create identity"        do ability.can?(:create, Identity.new).must_equal true end
        it "can show identity"          do ability.can?(:show, Identity.new).must_equal true end
        it "can edit identity"          do ability.can?(:edit, Identity.new).must_equal true end
        it "can update identity"        do ability.can?(:update, Identity.new).must_equal true end
        it "can switch identity"        do ability.can?(:switch, Identity.new).must_equal true end
        it "can delete identity"        do ability.can?(:delete, Identity.new).must_equal true end
      end

      describe 'Roles' do 
        it "can index role"         do ability.can?(:index, :roles).must_equal true end
        it "can create role"        do ability.can?(:create, Role.new).must_equal true end
        it "can show role"          do ability.can?(:show, Role.new).must_equal true end
        it "can edit role"          do ability.can?(:edit, Role.new).must_equal true end
        it "can update role"        do ability.can?(:update, Role.new).must_equal true end
        it "can delete role"        do ability.can?(:delete, Role.new).must_equal true end
      end

      describe 'Users' do 
        it "can index user"         do ability.can?(:index, :users).must_equal true end
        it "can create user"        do ability.can?(:create, User.new).must_equal true end
        it "can show user"          do ability.can?(:show, User.new).must_equal true end
        it "can edit user"          do ability.can?(:edit, User.new).must_equal true end
        it "can update user"        do ability.can?(:update, User.new).must_equal true end
        it "can switch user"        do ability.can?(:switch, User.new).must_equal true end
        it "can delete user"        do ability.can?(:delete, User.new).must_equal true end
      end
    end
  end
end