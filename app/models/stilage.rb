class Stilage < ActiveRecord::Base
  belongs_to :room, inverse_of: :stilages
  has_many :books
  
    accepts_nested_attributes_for :room, allow_destroy: true
end
