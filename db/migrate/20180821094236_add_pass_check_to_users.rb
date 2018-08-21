class AddPassCheckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pass_check, :bool, default: true
  end
end
