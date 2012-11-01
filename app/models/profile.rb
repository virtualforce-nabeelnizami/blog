class Profile < ActiveRecord::Base
  attr_accessible :adress, :photo, :intro
  has_attached_file :photo
  belongs_to :user
  
end
