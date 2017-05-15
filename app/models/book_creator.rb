class BookCreator < ActiveRecord::Base
  belongs_to :book
  belongs_to :creator, inverse_of: :book_creators
  
  validates :book, presence: true
  validates :creator, presence: true
end
