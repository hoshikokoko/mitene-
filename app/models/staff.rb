class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.gest
    find_or_create_by(employee_number: '3') do |gest|
      gest.password = SecureRandom.urlsafe_base64
    end
  end
end
