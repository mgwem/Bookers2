class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.new
    @bookone = Book.find(params[:id])
    @user = @bookone.user
  end

  def edit
  end
  
  def destroy
    @bookone = Book.find(params[:id])
    @bookone.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
