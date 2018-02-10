class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :gym_type
      t.string :listing_name
      t.text :summary
      t.string :address_string
      t.boolean :is_weights
      t.boolean :is_boxing
      t.boolean :is_internet
      t.boolean :is_lounge
      t.boolean :is_shower
      t.boolean :is_towel
      t.boolean :is_yoga
      t.boolean :is_cycling
      t.boolean :is_pilates
      t.boolean :is_pool
      t.boolean :is_basketball
      t.boolean :is_childcare
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
