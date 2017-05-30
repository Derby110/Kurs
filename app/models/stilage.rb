class Stilage < ActiveRecord::Base
  belongs_to :room, inverse_of: :stilages
  has_many :books, inverse_of: :stilage
  
    accepts_nested_attributes_for :room, allow_destroy: true, reject_if: :all_blank
end
