class PolySetting < ApplicationRecord
  belongs_to :settingable, polymorphic: true
end
