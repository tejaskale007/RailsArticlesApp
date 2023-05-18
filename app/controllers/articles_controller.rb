class ArticlesController < ApplicationController

    before_action :setArticle , only: [:show,:edit,:update,:destroy]

    def show
    end

    def index
         @articles = Article.all
    end

    def create 
        @article = Article.new(articleParameters)
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def new
        @article = Article.new
    end

    def edit
        # begin
        #     raise
        #     @article = Article.find(params[:id])
        #     rescue
        #       flash[:notice] = "Not able to find article"
        # end
    end

    def update 
        if @article.update(articleParameters)
            flash[:notice] = "Article was updated Successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private 
    def setArticle
        @article = Article.find(params[:id])
    end

    def articleParameters
        params.require(:article).permit(:title,:description)
    end
end