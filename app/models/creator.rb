class Creator < ActiveRecord::Base
  has_many :book_creators
  
  validates :last_name, presence: true
  validates :first_name, presence: true
end
