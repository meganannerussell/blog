class PostsController < ApplicationController
  skip_forgery_protection

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post = Post.create!(post_params)
    render json: post, status: :created
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id, tag_ids: [])
  end
end
