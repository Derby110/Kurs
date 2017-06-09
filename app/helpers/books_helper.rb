module BooksHelper
  def book_options()
    Book.all.pluck('id')
  end
end
