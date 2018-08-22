class ChangeHotColdToDouble < ActiveRecord::Migration[5.2]
  def change
    change_column :waters, :hot, :float 
  end 
end
