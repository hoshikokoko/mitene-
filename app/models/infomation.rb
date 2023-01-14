class Infomation < ApplicationRecord

  belongs_to :staff
  
  # tagテーブルとinfomationテーブルの関連付けをしてます。
  has_many :infomation_tags, dependent: :destroy
  has_many :tags, through: :infomation_tags
  
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    
    new_tags.each do |new|
      new_infomation_tag = Tag.find_or_create_by(name: new)
      self.tags << new_infomation_tag
    end
  end
end
