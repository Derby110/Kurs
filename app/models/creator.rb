class Creator < ActiveRecord::Base
  has_many :book_creators, inverse_of: :creator
  
  validates :last_name, presence: true
  validates :first_name, presence: true
end
