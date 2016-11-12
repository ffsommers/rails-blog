class ChatRoomsController < ApplicationController
     def index
     	if !current_user
			redirect_to new_user_session_path
		end
		@chat_rooms = ChatRoom.all
		@chat_room = ChatRoom.new
	end

	def new
		if !current_user
			redirect_to new_user_session_path
		end
		@chat_room = ChatRoom.new
	end

	def create

			redirect_to "https://ffsommers-blog.herokuapp.com/chat_rooms/1"

			@chat_room = current_user.chat_rooms.build(chat_room_params)
		if @chat_room.save
			flash[:success] = 'Chat room added!'
			redirect_to chat_rooms_path
		else
			render 'new'
		end
	end

	def show
		if !current_user
			redirect_to new_user_session_path
		end
		@chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
		@message = Message.new
		@appearances = []

    end
	private

	def chat_room_params
		params.require(:chat_room).permit(:title)
	end
end
