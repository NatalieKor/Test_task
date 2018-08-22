class ChangeColdToDouble < ActiveRecord::Migration[5.2]
  def change
    change_column :waters, :cold, :float
  end
end
