class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :adress 
      t.text :photo_file_name
      t.integer :photo_file_size
      t.text :photo_content_type
      t.references :user

      t.timestamps
    end
  end
end
