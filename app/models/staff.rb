class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 従業員は論理削除の扱いなのでdestroyはしないことにします。
  has_many :infomations
  
  has_many :bookmarks, dependent: :destroy
  
  has_many :infomation_comments, dependent: :destroy
         
  # ゲストユーザーがない場合新規作成し探し出します。
  # パスワードはランダム生成されます。
  def self.gest
    find_or_create_by(employee_number: '01') do |gest|
      gest.password = SecureRandom.urlsafe_base64
    end
  end
  
  
end
