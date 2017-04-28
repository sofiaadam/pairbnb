class Tag < ApplicationRecord

    has_many :listings, through: :tag_categories
	has_many :tag_categories, dependent: :destroy
    
end
