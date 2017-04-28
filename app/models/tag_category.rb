class TagCategory < ApplicationRecord
    belongs_to :tag, dependent: :destroy
	belongs_to :listing
end
