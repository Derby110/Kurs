json.extract! book, :id, :book_name, :part, :isbn_index, :publick_year, :number_of_have, :schelf_number, :stilage_id, :created_at, :updated_at
json.url book_url(book, format: :json)
