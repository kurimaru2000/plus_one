class BooksController < ApplicationController

def index
  @books = Book.includes(:user).order('created_at DESC')
  @rooms = Room.all

end

def new
  @book = Book.new
end

def create
  Book.create(book_params)
  redirect_to root_path
end

def show
  @book = Book.find(params[:id])

end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to root_path
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to root_path
end





private

def book_params
    params.require(:book).permit(:title, :author, :publishing_company, :explanation, :image).merge(user_id: current_user.id)
end

end