class User < ApplicationRecord
  attr_accessor :password
  # attr_accessible :name, :email, :password
  email_regex = /\A([^@\s]+)@((?:[-a-z-0-9]+\.)+[a-z]+)\z/i
  validates :name, :presence => true, :length => { :maximum => 50}
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness =>{ :case_sensitive => false }
  validates :password, :presence =>true, :length => { :minimum => 8}
  before_save :encrypt_password
 
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
