class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = Article.all.paginate(:page => params[:page], :per_page => 7)
  end

  def show
  end

  def edit
    @article.comments.build
  end

  def new
    @article = Article.new
    @article.comments.build
  end

  def update
    respond_to do |format|
      if @article.update(article_param)
        format.html { redirect_to article_path(@article), notice: "Edit successfully" }
        format.json { render :show, status: :updated, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @article = Article.new(article_param)
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Saved successfully" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @article.destroy
        format.html { redirect_to action: :index, notice: "Destroying successfully" }
        format.json { render :index, status: :destroyed }
      end
    end
  end

  def delete
    respond_to do |format|
      if @article.delete
        format.html { redirect_to action: :index, notice: "Destroying successfully" }
        format.json { render :index, status: :destroyed }
      end
    end
  end

  def search
    return unless params[:search]
    @articles = Article.search(params).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { render :index }
    end
  end

  private

  def load_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(Article.column_names, comments_attributes: [:content, :article_id])
  end
end
