class ArticlePdf < Prawn::Document
	def initialize(article)
    super(top_margin: 70)
      @article = article
  end
  
  def article
    text "article \##{article.article_name}",size: 20
    text "Author: #{article.author.name}",size: 20
    text "Category: #{article.category.name}",size:20      
  end
end