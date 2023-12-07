class AddCoordinatesToSnacks < ActiveRecord::Migration[7.1]
  def change
    add_column :snacks, :latitude, :float
    add_column :snacks, :longitude, :float
  end
end
