class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :available
      t.date :date

      t.timestamps
    end
  end
end
