class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
       
  # ゲストユーザーがない場合新規作成し探し出します。
  # パスワードはランダム生成されます。
  def self.guest
    find_or_create_by(employee_number: 'guest') do |guest|
      guest.password = SecureRandom.urlsafe_base64
    end
  end
  
end
