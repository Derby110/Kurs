class Room < ActiveRecord::Base
   has_many :stilages, inverse_of: :room
  
   validates :schort_name, presence: true, uniqueness: true
   validates :long_name, presence: true, uniqueness: true
end
