class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :city
      t.string :milage
      t.string :car_make
      t.string :engine_type
      t.string :price
      t.string :transmission_type
      t.string :color
      t.string :assembly_type
      t.string :engine_capacity
      t.string :primary_contact
      t.string :secondary_contact
      t.text :add_discription

      t.timestamps
    end
  end
end
