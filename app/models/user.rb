class User < ApplicationRecord
  validates :username, length: { minimum: 3, maximum: 64 }, presence: true
  validates :password, length: { minimum: 8, maximum: 64 }, presence: true
  validates :email, length: { minimum: 5, maximum: 500 }, presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  after_validation :hash_password

  has_many :sessions
  has_many :tweets 

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end
  
end
