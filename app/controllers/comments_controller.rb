class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :json, :html

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save

      respond_to do |format|
        format.html { redirect_to @post }
        format.js # render comments/create.js.erb
      end
    else
      flash[:danger] = "You must be signed in to perform that action!"
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
