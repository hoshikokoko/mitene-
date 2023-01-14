class Imfomation < ApplicationRecord
  
  belongs_to :staff
  
  # tagテーブルとinfomationテーブルの関連付けをしてます。
  has_many :infomation_tags, dependent: :destroy
  has_many :tags, through: :infomation_tags
end
