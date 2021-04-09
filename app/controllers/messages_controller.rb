class MessagesController < ApplicationController
 
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  
  def new
  end


  def create
    @book = Book.find(params[:book_id])
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
  end


  def show
  end
  
  private
  
  def message_params
    
    params.require(:message).permit(:text, :image, :room_id, :book_id).merge(user_id: current_user.id, room_id: params[:room_id])
  end



end

