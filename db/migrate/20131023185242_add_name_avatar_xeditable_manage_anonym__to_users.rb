class AddNameAvatarXeditableManageAnonymToUsers < ActiveRecord::Migration
  def change
    add_column :auth_users, :name, :string
    add_column :auth_users, :avatar, :string
    add_column :auth_users, :avatar_tmp, :string
    add_column :auth_users, :xeditable, :boolean, null: false, default: false
    add_column :auth_users, :manage, :boolean, null: false, default: false
    add_column :auth_users, :anonym, :boolean, null: false, default: false
  end
end
