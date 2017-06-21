class ChatroomsController < ApplicationController
	def index
		@chatrooms = Chatroom.all
	end

	def new
		@chatroom = Chatroom.new
	end

	def show
		@chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
		# @chatroom = Chatroom.find(params[:id])
		@message = Message.new
	end

	 def update
    @chatroom = Chatroom.find(params[:id])
    @chatroom.update(chatroom_params)
    redirect_to @chatroom
  end

	def create
		@chatroom = Chatroom.new(chatroom_params)
		user_chatroom_relation = UserChatroomship.new(:user => current_user, :chatroom => @chatroom)

		if @chatroom.save
			user_chatroom_relation.save
			redirect_to @chatroom
		else
			render 'new'
		end
	end

	def join
		@chatroom = Chatroom.find(params[:id])
		logger.debug("join chatroom': #{@chatroom}")
	user_chatroom_relation = UserChatroomship.create(:user => current_user, :chatroom => @chatroom)
		redirect_to @chatroom
	end

	private

	def chatroom_params
		params.require(:chatroom).permit(:name)
	end
end
