class Location < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  scope :published, -> { where(published: true) }


  def publish!
    self.update! published: true
  end

  def unpublish!
    self.update! published: false
  end

  def toggle_publication!
    self.published? ? unpublish! : publish!
  end
end
