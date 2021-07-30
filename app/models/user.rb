class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :records, dependent: :destroy
  has_many :items, through: :records
end
