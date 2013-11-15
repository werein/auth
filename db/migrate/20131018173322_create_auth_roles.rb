class CreateAuthRoles < ActiveRecord::Migration
  def change
    create_table :auth_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
