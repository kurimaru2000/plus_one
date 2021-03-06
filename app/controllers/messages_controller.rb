class MessagesController < ApplicationController
  def index
    @message = Message.includes(:user).order('created_at DESC')
    @book = Book.find(params[:book_id])
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
    redirect_to book_room_messages_path
    @messages = Message.all
  end

  
  private

  def message_params
    params.require(:message).permit(:text, :image, :room_id, :book_id).merge(user_id: current_user.id,
                                                                             room_id: params[:room_id])
  end
end
