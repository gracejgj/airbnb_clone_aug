class Listing < ApplicationRecord
  belongs_to :host
  has_many_attached :photos

  scope :is_available, -> {where(available:true ) } #to filter data to get only available
end


#plural nouns: photos
#model - routes - controller
