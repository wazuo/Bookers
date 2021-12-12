class BooksController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @book = book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(books)
  end  

  def edit
  end
end

