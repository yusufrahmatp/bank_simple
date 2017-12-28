class User < ApplicationRecord
  has_many :transactions
  before_save {self.username = username.downcase}
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :balance, presence: true, numericality: {greater_than: 0}
end
