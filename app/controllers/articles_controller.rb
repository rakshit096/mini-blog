class ArticlesController < ApplicationController
    before_action :require_user, only: [ :index, :new, :create, :destroy ]  #to restrict controller actions
    def index
        @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = current_user.articles.build(article_params) ## Step 1: Takes form params AND automatically sets user_id = ex-5

      if @article.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
    @article = Article.find(params[:id])
    end

    def destroy
    @article=current_user.articles.find(params[:id])
    @article.destroy
    redirect_to articles_path
    end

private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
