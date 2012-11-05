class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :category_name

      t.timestamps
    end
  end
end
