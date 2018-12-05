class Article < ApplicationRecord
	belongs_to :category
	belongs_to :author
	
	after_destroy :log_destroy_action
    def log_destroy_action
        puts 'Article destroyed'
    end

    after_create :article_publishing 
    private
    def article_publishing
      
      puts "article is published"

      self.status = "success"

      self.save!

    end

    validates :name, presence: true, length: { minimum: 6}, uniqueness: true, unless: :skip_name_validation
    validates :description, presence: true, length: { minimum: 15}
    validates :is_published, acceptance: true

    attr_accessor :skip_name_validation
end
