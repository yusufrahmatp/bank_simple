class Bank < ApplicationRecord
  validates :username, presence: true, length: { minimum: 5, maximum: 10 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  validates :balance, presence: true, numericality: { greater_than: 0 }
end