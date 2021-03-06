class BookCreator < ActiveRecord::Base
  belongs_to :book, inverse_of: :book_creators 
  belongs_to :creator
  
  accepts_nested_attributes_for :creator, allow_destroy: true, reject_if: :all_blank
  
  validates :book, presence: true
  validates :creator, presence: true
end
