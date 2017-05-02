class Listing < ApplicationRecord
    mount_uploaders :images, AvatarsUploader
    belongs_to :user
    has_many :tags, through: :tag_categories
	has_many :tag_categories, dependent: :destroy
    

   enum property_type: [:house, :apartment]
   enum room_type: [:shared_room, :private_room, :entire_room]
    

end
