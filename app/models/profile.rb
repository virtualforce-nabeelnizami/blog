class Profile < ActiveRecord::Base
  attr_accessible :adress, :name
  belongs_to :user
  has_many :user_assets
end
