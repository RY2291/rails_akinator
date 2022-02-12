class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.integer :game_id
      t.integer :sequence
      t.integer :question_id
      t.integer :answer

      t.timestamps
    end
  end
end
