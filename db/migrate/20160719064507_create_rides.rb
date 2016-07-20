class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :cab_id
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      
      t.timestamps 
    end
  end
end
