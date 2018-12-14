class Article < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6}, uniqueness: true
  validates :description, presence: true, length: { minimum: 15}
  validates :is_published, acceptance: true
  belongs_to :category
  belongs_to :author
  has_and_belongs_to_many :languages
  scope :created_before, ->(time) { where("created_at < ?", time) }
  after_destroy :log_destroy_action
  after_create :article_publishing 
  
  def log_destroy_action
    puts 'Article destroyed'
  end
  
  private
  
  def article_publishing
    puts "article is published"
    self.status = "success"
    self.save!
  end
end
