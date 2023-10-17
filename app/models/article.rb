class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: { maximum: 5 }

  accepts_nested_attributes_for :comments, allow_destroy: true

  after_save: update_title

  private

  def update_title

  end
end
