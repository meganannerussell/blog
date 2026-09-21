class TagsController < ApplicationController
  skip_forgery_protection

  def index
    tags = Tag.all
    render json: tags
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag
  end

  def create
    tag = Tag.create!(tag_params)
    render json: tag, status: :created
  end

  def update
    tag = Tag.find(params[:id])
    tag.update!(tag_params)
    render json: tag
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy!
    head :no_content
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
