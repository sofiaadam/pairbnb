class Listing < ApplicationRecord
    belongs_to :user

   enum property_type: [:house, :apartment]
   enum room_type: [:shared_room, :private_room, :entire_room]
    

end
