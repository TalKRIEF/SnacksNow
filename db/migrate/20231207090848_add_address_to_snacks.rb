class AddAddressToSnacks < ActiveRecord::Migration[7.1]
  def change
    add_column :snacks, :address, :string
  end
end
