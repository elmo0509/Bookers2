class UsersController < ApplicationController

# 他人の編集画面に遷移出来ない設定
before_action :correct_user, only: [:edit, :uodate]


  def index
    @loginuser = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book was successfully created."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @current_user = current_user
    @user = User.find(params[:id])
    redirect_to user_path(@current_user) unless @user == current_user
  end

end