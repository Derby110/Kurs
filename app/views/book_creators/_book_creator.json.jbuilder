json.extract! book_creator, :id, :book_id, :creator_id, :created_at, :updated_at
json.url book_creator_url(book_creator, format: :json)
