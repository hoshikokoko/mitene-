class InfomationComment < ApplicationRecord
  belongs_to :staff
  belongs_to :infomation
  
  validates :comment, presence: true
end
