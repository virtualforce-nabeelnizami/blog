
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :name
      t.text :title
      t.text :content
      t.references :category

      t.timestamps
    end
  end
 
end
