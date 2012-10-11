class UserAsset < ActiveRecord::Base
  attr_accessible :photo, :profile_id
  has_attached_file :photo
  belongs_to :profile
end
