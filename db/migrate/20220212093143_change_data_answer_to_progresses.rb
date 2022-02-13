class ChangeDataAnswerToProgresses < ActiveRecord::Migration[6.1]
  def change
    change_column :progresses, :answer, :string
  end
end
