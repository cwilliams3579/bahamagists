class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :images
      t.string :title
      t.string :address
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
