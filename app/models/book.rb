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
  
  def self.search(params)
    result = Book.includes(:creators).references(:creators)
    if params['book_name'].present?
      result = result.where(book_name: params['book_name'])
    end
    if params['isbn_index'].present?
      result = result.where(isbn_index: params['isbn_index'])
    end
    if params['part'].present?
      result = result.where(part: params['part'])
    end
    if params['publick_year'].present?
      result = result.where(publick_year: params['publick_year'])
    end
    if params['number_of_have'].present?
      result = result.where(number_of_have: params['number_of_have'])
    end
    if params['schelf_number'].present?
      result = result.where(schelf_number: params['schelf_number'])
    end
    if params['last_name'].present?
      result = result.where(creators: {last_name: params['last_name']})
    end
    if params['first_name'].present?
      result = result.where(creators: {first_name: params['first_name']})
    end
    if params['second_name'].present?
      result = result.where(creators: {second_name: params['second_name']})
    end
    result.all
  end
end
