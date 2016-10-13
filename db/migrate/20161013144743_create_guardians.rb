class CreateGuardians < ActiveRecord::Migration[5.0]
  def change
    create_table :guardians do |t|
      t.integer :guardian_class
      t.boolean :enabled, default: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
