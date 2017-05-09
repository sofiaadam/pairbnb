class Listing < ApplicationRecord
    include PgSearch
    mount_uploaders :images, AvatarsUploader
    
    belongs_to :user
    
    has_many :tags, through: :tag_categories
	has_many :tag_categories, dependent: :destroy
    has_many :reservations, dependent: :destroy
    


   enum property_type: [:house, :apartment]
   enum room_type: [:shared_room, :private_room, :entire_room]
    
#    scope :bathroom, -> num {(where(bathroom:num))}
#    scope :min_max_price, -> (min,max) { where('price > ? AND price < ?', min, max) }
multisearchable :against => [:address, :bathroom, :price]
#YOU STOP HERE - before moving on to rspec
   
end
