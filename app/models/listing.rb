class Listing < ApplicationRecord
  belongs_to :host
  has_many_attached :photos
end

#plural nouns: photos

#model - routes - controller
