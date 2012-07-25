class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :links

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
