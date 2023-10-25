class Article < ApplicationRecord
  has_many :comments
  has_many :poly_settings, as: :settingable
  validates :title, presence: true, length: { maximum: 5 }

  accepts_nested_attributes_for :comments, allow_destroy: true

  after_commit :update_title
  after_save :create_setting

  private

  def update_title
    CreateArticleJob.perform_now
  end

  def create_setting
    PolySetting.create(content: "test Article", settingable: Article.last)
  end
end
