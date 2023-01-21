class Tag < ApplicationRecord
  # tagテーブルとinfomationテーブルの関連付けをしてます。
  has_many :infomation_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :infomations, through: :infomation_tags
  
end
