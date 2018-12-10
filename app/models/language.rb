class Language < ApplicationRecord
	has_and_belongs_to_many :articles
	validates_associated :articles
end
