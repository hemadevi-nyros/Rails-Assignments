class Category < ApplicationRecord
	has_many :articles
	validates_associated :articles
end
