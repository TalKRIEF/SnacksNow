class ChangeSnackPriceToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :snacks, :price, :float
  end
end
