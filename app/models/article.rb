class Article < ApplicationRecord
	belongs_to :category
	belongs_to :author
    
    validates :name, presence: true, length: { minimum: 6}, uniqueness: true, unless: :skip_name_validation
    validates :description, presence: true, length: { minimum: 15}
    validates :is_published, acceptance: true

    attr_accessor :skip_name_validation
end
