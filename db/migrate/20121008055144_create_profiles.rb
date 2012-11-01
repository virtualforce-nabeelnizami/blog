class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :adress
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.references :user

      t.timestamps
    end
  end
end
