class MessagesController < ApplicationController
  def index
    @messages = Message.order(created_at: :desc)
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    render :new, layout: false
  end
  
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Message sent!"
    else
      render partial: "form_modal", layout: false, status: :unprocessable_entity
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:sender, :recipient, :subject, :body)
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end
