class PostsController < ApplicationController
  skip_before_action only: [:index, :show]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(get_post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render 'index'
    end
  end

  private

  def get_post_params
    params.require(:post).permit(:content)
  end
end
