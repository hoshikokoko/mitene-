class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 従業員は論理削除の扱いなのでdestroyはしないことにします。
  has_many :infomations
  
  has_many :bookmarks, dependent: :destroy
  
  has_many :infomation_comments, dependent: :destroy
  
  has_many :reads, dependent: :destroy
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
         
  def self.search_for(content, method)
    if method == "perfect_match"
      @user = Staff.where("first_name || last_name LIKE?", "#{content}")
    elsif method == "forward_match"
      @user = Staff.where("first_name || last_name LIKE?","#{content}%")
    elsif method == "backward_match"
      @user = Staff.where("first_name || last_name LIKE?","%#{content}")
    elsif method == "partial_match"
      @user = Staff.where("first_name || last_name LIKE?","%#{content}%")
    else
      @user = Staff.all
    end
  end
  
end
