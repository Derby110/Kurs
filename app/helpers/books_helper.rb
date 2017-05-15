module BooksHelper
  def book_options()
    Role.all.pluck('id')
  end
end
