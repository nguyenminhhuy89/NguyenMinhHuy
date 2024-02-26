class Api::V1::PostsController < ApplicationController
  # load_and_authorize_resource
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end
end
