class CommentsController < ApplicationController


  def create

    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      redirect_to article_path(@article)

  end

  def show
    @comments = Comment.all
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id ==  @comment.user.id
      @comment.destroy
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
     end
  end


  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
