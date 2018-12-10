class CreateArticleLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_languages do |t|
      t.references :language, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
