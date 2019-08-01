class ArticlesController < ApplicationController

  before_action :wrap_in_transaction, only: [:show ,:update ,:edit]



  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def index

    @q = Article.ransack(params[:q])

    if @q.present?
      @articles = @q.result.page(params[:page])
    else
      @articles = Article.all.page(params[:page])
    end
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  #
  # def edit
  #   # @article = Article.find(params[:id])
  # end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path

  end

  # def show
  #   # @article = Article.find(params[:id])
  #
  # end

  def new
    @article = Article.new
  end

  private
  def article_params
    params.require(:article).permit(:title, :body,:image)
  end

  def wrap_in_transaction
    @article = Article.find_by_id(params[:id])
  end



end

