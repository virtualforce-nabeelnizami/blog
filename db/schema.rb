# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121008060318) do

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "pma_bookmark", :force => true do |t|
    t.string "dbase", :default => "", :null => false
    t.string "user",  :default => "", :null => false
    t.string "label", :default => "", :null => false
    t.text   "query",                 :null => false
  end

  create_table "pma_column_info", :force => true do |t|
    t.string "db_name",                :limit => 64, :default => "", :null => false
    t.string "table_name",             :limit => 64, :default => "", :null => false
    t.string "column_name",            :limit => 64, :default => "", :null => false
    t.string "comment",                              :default => "", :null => false
    t.string "mimetype",                             :default => "", :null => false
    t.string "transformation",                       :default => "", :null => false
    t.string "transformation_options",               :default => "", :null => false
  end

  add_index "pma_column_info", ["db_name", "table_name", "column_name"], :name => "db_name", :unique => true

  create_table "pma_designer_coords", :id => false, :force => true do |t|
    t.string  "db_name",    :limit => 64, :default => "", :null => false
    t.string  "table_name", :limit => 64, :default => "", :null => false
    t.integer "x"
    t.integer "y"
    t.integer "v",          :limit => 1
    t.integer "h",          :limit => 1
  end

  create_table "pma_history", :force => true do |t|
    t.string    "username",  :limit => 64, :default => "", :null => false
    t.string    "db",        :limit => 64, :default => "", :null => false
    t.string    "table",     :limit => 64, :default => "", :null => false
    t.timestamp "timevalue",                               :null => false
    t.text      "sqlquery",                                :null => false
  end

  add_index "pma_history", ["username", "db", "table", "timevalue"], :name => "username"

  create_table "pma_pdf_pages", :primary_key => "page_nr", :force => true do |t|
    t.string "db_name",    :limit => 64, :default => "", :null => false
    t.string "page_descr", :limit => 50, :default => "", :null => false
  end

  add_index "pma_pdf_pages", ["db_name"], :name => "db_name"

  create_table "pma_relation", :id => false, :force => true do |t|
    t.string "master_db",     :limit => 64, :default => "", :null => false
    t.string "master_table",  :limit => 64, :default => "", :null => false
    t.string "master_field",  :limit => 64, :default => "", :null => false
    t.string "foreign_db",    :limit => 64, :default => "", :null => false
    t.string "foreign_table", :limit => 64, :default => "", :null => false
    t.string "foreign_field", :limit => 64, :default => "", :null => false
  end

  add_index "pma_relation", ["foreign_db", "foreign_table"], :name => "foreign_field"

  create_table "pma_table_coords", :id => false, :force => true do |t|
    t.string  "db_name",         :limit => 64, :default => "",  :null => false
    t.string  "table_name",      :limit => 64, :default => "",  :null => false
    t.integer "pdf_page_number",               :default => 0,   :null => false
    t.float   "x",                             :default => 0.0, :null => false
    t.float   "y",                             :default => 0.0, :null => false
  end

  create_table "pma_table_info", :id => false, :force => true do |t|
    t.string "db_name",       :limit => 64, :default => "", :null => false
    t.string "table_name",    :limit => 64, :default => "", :null => false
    t.string "display_field", :limit => 64, :default => "", :null => false
  end

  create_table "pma_tracking", :id => false, :force => true do |t|
    t.string   "db_name",         :limit => 64,                        :null => false
    t.string   "table_name",      :limit => 64,                        :null => false
    t.integer  "version",                                              :null => false
    t.datetime "date_created",                                         :null => false
    t.datetime "date_updated",                                         :null => false
    t.text     "schema_snapshot",                                      :null => false
    t.text     "schema_sql"
    t.text     "data_sql",        :limit => 2147483647
    t.string   "tracking",        :limit => 0
    t.integer  "tracking_active",                       :default => 1, :null => false
  end

  create_table "pma_userconfig", :primary_key => "username", :force => true do |t|
    t.timestamp "timevalue",   :null => false
    t.text      "config_data", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_assets", :force => true do |t|
    t.integer  "profile_id"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
