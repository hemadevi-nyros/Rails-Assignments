class Category < ApplicationRecord
	has_many :articles, dependent: :destroy
	validates_associated :articles
end
