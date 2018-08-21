class CreateWaters < ActiveRecord::Migration[5.2]
  def change
    create_table :waters do |t|
      t.integer :hot
      t.integer :cold
      t.datetime :datein

      t.timestamps
    end
  end
end
