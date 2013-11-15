class CreateAuthIdentities < ActiveRecord::Migration
  def change
    create_table :auth_identities do |t|
      t.references :user, index: true
      t.integer :uid
      t.string :provider
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
