class CreateComics < ActiveRecord::Migration[6.1]
  def change
    create_table :comics do |t|

      t.string :title
      t.integer :serializayion_started_year
      t.integer :serializayion_end_year
      t.string :publisher
      t.string :genre

      t.timestamps
    end
  end
end
