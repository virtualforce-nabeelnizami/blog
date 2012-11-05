class Category < ActiveRecord::Base
  attr_accessible :category_name
  has_many :posts
  define_index do
    indexes :category_name, :sortable => true
  end
end
