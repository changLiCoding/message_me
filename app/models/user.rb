class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 2, maximum: 18}
  VALID_EMAIL_REGEX = /\A[\w+\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {in: 6..80}, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {in: 6..20}
  has_secure_password
  has_many :messages, dependent: :destroy

end
