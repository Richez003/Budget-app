class Record < ApplicationRecord
  belongs_to :user
  has_many :category,

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
