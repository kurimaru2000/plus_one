class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit destroy update]

  def index
    @books = Book.includes(:user).order('created_at DESC')
    @rooms = Room.order('created_at DESC').limit(6)
    # @book = Book.find(params[:id])
    # @book_name =Book.find([Room.find(book_id)]).title
  end

  def index2; end

  def new
    @book = Book.new
  end

  def create
    
   @book = Book.create(book_params)
   if @book.save
    redirect_to root_path
  else
    render :new
   end
  end

  def show
    @book = Book.find(params[:id])
    @rooms = Room.where(book_id: params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    redirect_to root_path if @book.update(book_params)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publishing_company, :explanation,
                                 :image).merge(user_id: current_user.id)
  end
end
