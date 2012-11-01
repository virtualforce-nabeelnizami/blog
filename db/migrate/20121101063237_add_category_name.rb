class AddCategoryName < ActiveRecord::Migration
  def up
    execute "insert into categories (category_name) values ('Food')"
    execute "insert into categories (category_name) values ('Cars')"
    execute "insert into categories (category_name) values ('Computers')"
    execute "insert into categories (category_name) values ('Smart Phones')"
    execute "insert into categories (category_name) values ('Trevel')"
    execute "insert into categories (category_name) values ('Education')"
    execute "insert into categories (category_name) values ('Health')"
  end

  def down
    CategoryName.delete_all
  end
end
