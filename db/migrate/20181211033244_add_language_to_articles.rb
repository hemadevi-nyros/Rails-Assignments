class AddLanguageToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :language, foreign_key: true
  end
end
