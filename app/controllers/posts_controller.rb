class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  private

   def find_post
      @post = Post.find(params[:post_id])
end

    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
