class CreateListings < ActiveRecord::Migration[5.0]
  def change
   create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :property_type
      t.integer :room_type
      t.integer :guest
      t.integer :bedroom
      t.integer :bathroom
      t.integer :price
      t.string :address
      t.references :user

      t.timestamps
    end
  end
end
