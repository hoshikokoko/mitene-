class Infomation < ApplicationRecord

  belongs_to :staff
  
  # tagテーブルとinfomationテーブルの関連付けをしてます。
  has_many :infomation_tags, dependent: :destroy
  has_many :tags, through: :infomation_tags
  
  has_many :bookmarks, dependent: :destroy
  
  has_many :infomation_comments, dependent: :destroy
  
  has_many :reads, dependent: :destroy
  
  has_many :notifications, dependent: :destroy
  
  # すでにブックマークしているか判定します
  def bookmarked_by?(staff)
    bookmarks.where(staff_id: staff.id).exists?
  end
  
  # すでに既読されているか判定します
  def readed_by?(staff)
    reads.where(staff_id: staff.id).exists?
  end
  
  
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
  
  def self.search_for(model, content, method)
    if model == 'infomation_title'
      if method == 'perfect'
        Infomation.where(title: content)
      elsif method == 'forward'
        Infomation.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Infomation.where('title LIKE ?', '%'+content)
      else
        Infomation.where('title LIKE ?', '%'+content+'%')
      end
    else
      if method == 'perfect'
        Infomation.where(body: content)
      elsif method == 'forward'
        Infomation.where('body LIKE ?', content+'%')
      elsif method == 'backward'
        Infomation.where('body LIKE ?', '%'+content)
      else
        Infomation.where('body LIKE ?', '%'+content+'%')
      end
    end
  end
  
  def create_notification_comment!(current_staff, comment_id)
    commented_staffs = Comment.select(:staff_id).where(infomation_id: id).where.not(staff_id: current_staff.id).distinct
    commented_staffs.each do |commented_staff|
      save_notification_comment!(current_staff, comment_id, commented_staff_id['staff_id'])
    end
    save_notification_comment!(current_staff, comment_id, staff_id) if commented_staffs.blank?
  end
  
  def save_notification_comment!(current_staff, comment_id, visited_id)
    notification = current_staff.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.is_checked = true
    end
    notification.save if notification.valid?
  end
end
