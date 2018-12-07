class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
    @categories = Category.all.map{|cat| [ cat.name, cat.id ] }
    @author = Author.all.map{|auth| [ auth.name, auth.id ] }
    @language = Language.all.map{|lang| [ lang.name, lang.id] }
  end
 
  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.map{|cat| [ cat.name, cat.id ] }
    @authors = Author.all.map{|auth| [ auth.name, auth.id] }
    @language = Language.all.map{|lang| [ lang.name, lang.id] }
  end
 
  def create
   @article = Article.new(article_params)
   if  @article.save
   redirect_to @article, notice: 'Article has been created.'
   else
   render :new
   end 
   @article.category_id = params[:category_id]
   @article.author_id = params[:author_id]
   @article.language_id = params[:language_id]
  end
 
  def update
    @article = Article.find(params[:id])
    @article.category_id = params[:category_id]
    @article.author_id = params[:author_id]
    @article.language_id = params[:language_id]
    if @article.update(article_params)
    redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
 
  private
  def article_params
    params.require(:article).permit( :name,:description,:category_id,:category_name,:author_id,:author_name,:language_id,:language_name,:upload,:is_published )
  end
end


