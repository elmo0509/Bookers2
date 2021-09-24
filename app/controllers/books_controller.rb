class BooksController < ApplicationController

  def create
    # バリデーション設定のため(未理解)
    @newbook = Book.new
    @user = current_user
    @books = Book.all

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    # バリデーション設定のため（未理解）
    @book = Book.new
    @book.user_id = current_user.id

    @newbook = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @newbook =Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @current_user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end
