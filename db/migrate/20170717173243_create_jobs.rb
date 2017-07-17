class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :company
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
