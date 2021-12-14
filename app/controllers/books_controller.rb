class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book =Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice:'createに成功しました[successfully]'
    else @books = Book.all
      render :index
    end
  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book),notice:'updateに成功しました[successfully]'
    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path,notice:'destroyに成功しました[successfully]'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

