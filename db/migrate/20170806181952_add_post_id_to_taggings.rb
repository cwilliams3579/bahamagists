class AddPostIdToTaggings < ActiveRecord::Migration[5.1]
  def change
    add_reference :taggings, :post, foreign_key: true
  end
end
