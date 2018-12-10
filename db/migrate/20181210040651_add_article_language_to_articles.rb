class AddArticleLanguageToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :language, foreign_key: true
    add_reference :articles, :article, foreign_key: true
  end
end
