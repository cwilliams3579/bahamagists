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
      # ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      flash[:notice] = "Comment was created successfully"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
