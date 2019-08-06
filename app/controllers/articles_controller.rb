class ArticlesController < ApplicationController

  def create
    @article = current_user.articles.new(article_params)
    if @article.save

      @article.tags.create(line: params[:line])
      redirect_to @article
    else
      render 'new'
    end
  end

  def index

    # @articles= Article.search(params[:search])
    # ====== Simple search ======
    # if params[:search].present?
    #
    #   @articles = Article.where("title ILIKE ? ", "%#{params[:search]}%").order(:title).page(params[:page])
    # else
    #   @articles = Article.order(:title).page(params[:page])
    # end
    # ======== END=============
    # =======Ransack=========
    @q = Article.ransack(params[:q])

    if @q.present?
      @articles = @q.result.page(params[:page])
    else
      @articles = Article.all.page(params[:page])
    end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path

  end

  def show
    @article = Article.find(params[:id])

  end

  def new
    @article = Article.new
  end

  private
  def article_params
    params.require(:article).permit(:title, :body,:image)
  end

end

