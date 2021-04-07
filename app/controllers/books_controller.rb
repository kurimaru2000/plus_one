class BooksController < ApplicationController

def index
end

def new
  @book = Book.new
end

def create
  Book.create(book_params)
  redirect_to root_path
end

end

private

def book_params
    params.require(:book).permit(:title, :author, :publishing_company, :explanation, :image).merge(user_id: current_user.id)
end