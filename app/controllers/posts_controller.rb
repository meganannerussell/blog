class PostsController < ApplicationController
  skip_forgery_protection
  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.create!(post_params)
    render json: post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end
end
