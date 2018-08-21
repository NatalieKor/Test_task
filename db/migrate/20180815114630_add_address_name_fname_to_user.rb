class AddAddressNameFnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :fname, :string
  end
end
