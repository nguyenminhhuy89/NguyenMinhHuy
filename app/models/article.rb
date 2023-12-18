class Article < ApplicationRecord
  has_many :poly_settings, as: :settingable
  validates :title, presence: true, length: { maximum: 7 }

  after_commit :update_title
  after_save :create_setting
            
  scope :all_records, -> { order(title: :asc) }

  def self.search(params)
    Article.where('LOWER(title) LIKE :title', {title: "%#{params[:search].strip.downcase}%"})
  end

  private

  def update_title
    CreateArticleJob.perform_now
  end

  def create_setting
    PolySetting.create(content: "test Article", settingable: Article.last)
  end
end
