class CreateUserAssets < ActiveRecord::Migration
  def change
    create_table :user_assets do |t|
      t.references :profile
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type

      t.timestamps
    end
  end
end
