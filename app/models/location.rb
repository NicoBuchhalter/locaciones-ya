class Location < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
