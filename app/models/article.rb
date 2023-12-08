class Article < ApplicationRecord
  has_many :comments, inverse_of: :article
  has_many :poly_settings, as: :settingable
  validates :title, presence: true, length: { maximum: 7 }

  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank

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
