class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title , :category_id
  validates :name,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  has_many :comments
  belongs_to :category
  belongs_to :user

  define_index do
    indexes :category_id, :sortable => true
    indexes :name, :sortable => true
  end
#  def self.search(search)
#  if search
#    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#  else
#    find(:all)
#  end
#end


end

