xml.instruct!
xml.articles do
  @articles.each do |article|
    xml.article do
      xml.name article.name
      xml.description article.description
      xml.category article.category.name
      xml.author   article.author.name
      xml.language_id article.language_id
    end
  end
end
