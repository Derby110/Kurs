class Book < ActiveRecord::Base
  belongs_to :stilage, inverse_of: :books
  has_many :book_creators, dependent: :destroy, inverse_of: :book
  has_many :creators, through: :book_creators
  
  validates :book_name, presence: true, uniqueness: true
  validates :isbn_index, presence: true, uniqueness: true
  validates :part, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :publick_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2017 }
  validates :number_of_have, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :schelf_number, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  accepts_nested_attributes_for :book_creators, allow_destroy: true
  accepts_nested_attributes_for :stilage, allow_destroy: true
end
