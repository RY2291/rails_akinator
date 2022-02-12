class RenameSerializayionStartedYearColumnToComics < ActiveRecord::Migration[6.1]
  def change
    rename_column :comics, :serializayion_started_year, :serialization_started_year
    rename_column :comics, :serializayion_end_year, :serialization_end_year
  end
end
