class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
