class CommentsController < ApplicationController
  before_action :set_message, only: [:create]

  def create
    @comment = @message.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @message }
      end
    else
      # Handle error state
    end
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  # Temporary override while Auth0 isn't set up
  def current_user
    User.first
  end
end
