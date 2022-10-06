class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :records, dependent: :destroy
  validates :name, presence: true, length: { minimum: 1, maximum: 150 }
end
