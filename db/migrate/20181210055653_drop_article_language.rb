class DropArticleLanguage < ActiveRecord::Migration[5.2]
  def change
  	drop_table :article_languages
  end
end
