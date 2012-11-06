class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title , :category_id
  validates :name,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  has_many :comments, :foreign_key => 'post_id'
  belongs_to :category , :foreign_key => 'category_id'
  belongs_to :user, :foreign_key => 'user_id'

  define_index do
#    indexes :category_id, :sortable => true
    indexes :name, :sortable => true
    indexes :title, :sortable => true
  end
#  def self.search(search)
#  if search
#    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#  else
#    find(:all)
#  end
#end


end

