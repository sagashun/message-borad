class MessagesController < ApplicationController
before_action :set_message, only: [:edit, :update]
def edit
end

def update
if @message.update(message_params)
redirect_to root_path,notice: 'update complete!!'
else
render 'edit'
end
end

def index
@message = Message.new
@messages = Message.all
end

def create
@message = Message.new(message_params)
if @message.save
redirect_to root_path,notice:'save complete!!'
else
@messages = Message.all
flash.now[:alert] = "save mistake!!"
render 'index'
end
end

private
def message_params
params.require(:message).permit(:name,:body)
end
def set_message
@message = Message.find(params[:id])
end

end
