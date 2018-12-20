class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.first(3)
    @articles = Article.last(1)
    @articles = Article.take(2)
    @articles = Article.where(name: "Computers")
    @articles = Article.where(["name = ? AND author_id= ?", "Moral words", 1])
    @articles = Article.where(category_id: [1,2])
    @articles = Article.where.not(author_id: 1)
    @articles = Article.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
    @articles = Article.where(name: "Moral words").or(Article.where(category_id: 2))
    @articles = Article.order(:created_at)
    @all_articles_count = Article.count :all
    @articles = Author.joins("INNER JOIN articles ON articles.author_id = articles.id AND articles.is_published = 't'")
    @articles = Article.joins(:category, :languages)
    @articles = Article.includes(:category, :author)
    @articles = Article.created_before(Time.zone.now)
    @all_articles = Article.group(:is_published).count
    @article = Article.select("articles.id, count(authors.id) as ct").joins(:authors).group("articles.id").having("count(authors.id) > ?", 3)
    respond_to do |format|
      format.html 
      format.xml 
    end
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
    @languages= Language.all
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
     redirect_to @article, notice: 'Successfully created' 
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
    redirect_to articles_path, notice:"Successfully deleted"
  end
 
  private
  
  def article_params
    params.require(:article).permit( :name, :description,  :content, :category_id, :category_name, :author_id, :author_name, :language_id, :language_name, :upload, :is_published )
  end
end


