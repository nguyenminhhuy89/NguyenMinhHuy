class Api::V1::ArticlesController < ApplicationController
  # load_and_authorize_resource
  def index
    @articles = Article.all_records
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end
end
