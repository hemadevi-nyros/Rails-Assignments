class ArticleLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :article
end
