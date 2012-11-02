#class AddCategoryName < ActiveRecord::Migration
#  def up
##    execute "insert into categories (category_name) values ('Food')"
##    execute "insert into categories (category_name) values ('Cars')"
##    execute "insert into categories (category_name) values ('Computers')"
##    execute "insert into categories (category_name) values ('Smart Phones')"
##    execute "insert into categories (category_name) values ('Trevel')"
##    execute "insert into categories (category_name) values ('Education')"
##    execute "insert into categories (category_name) values ('Health')"
#  end
#
#  def down
#    CategoryName.delete_all
#  end
#end



class AddCategoryName < ActiveRecord::Migration
  def self.up

    Category.create :category_name => "Food"
    Category.create :category_name => "Cars"
    Category.create :category_name => "Computers"
    Category.create :category_name => "Smart Phones"
    Category.create :category_name => "Trevel"
    Category.create :category_name => "Education"
    Category.create :category_name => "Health"
    Category.create :category_name => "Media"
  end

  def self.down
      drop_table :categories
  end
end