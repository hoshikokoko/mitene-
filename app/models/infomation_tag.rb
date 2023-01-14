class InfomationTag < ApplicationRecord
  belongs_to :infomation
  belongs_to :tag
  
  validates :infomation_id, presence: true
  validates :tag_id, presence: true
end
