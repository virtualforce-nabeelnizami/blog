class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :name
      t.string :title
      t.text :content
      t.references :category

      t.timestamps
    end
  end
 
end
