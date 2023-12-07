class Post < ApplicationRecord
  belongs_to :post_type
  has_many :poly_settings, as: :settingable

  after_save :create_setting

  delegate :name, to: :post_type,
    allow_nil: true, prefix: true,
    default: "NguyenMinh"

  private

  def create_setting
    PolySetting.create(content: "test 123456", settingable: Post.last)
  end
end
