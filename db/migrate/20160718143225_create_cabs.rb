class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :available, default: true
      t.boolean :pink
      t.timestamps null: false
    end
  end
end
