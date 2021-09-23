class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @newbook =Book.new
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book.id)
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end
