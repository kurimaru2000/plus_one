class RoomsController < ApplicationController
  before_action :room_find, only: [:show]
  def new
    @book = Book.find_by(id: params[:book_id])
    @room = Room.new
  end

  def create
    @book = Book.find_by(id: params[:book_id])
    @room = @book.rooms.new(room_params)
    Room.create(room_params)
    redirect_to root_path
  end

  def show
    @message = Message.new
    @room = Room.find(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:name, :capacity, :goal, :book_id).merge(book_id: params[:book_id])
  end

  def room_find
    @room = Room.find(params[:id])
  end
end
