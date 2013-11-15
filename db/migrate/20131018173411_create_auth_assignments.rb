class CreateAuthAssignments < ActiveRecord::Migration
  def change
    create_table :auth_assignments do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
