class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
