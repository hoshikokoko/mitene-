class Bookmark < ApplicationRecord
  belongs_to :infomation
  belongs_to :staff
  
  validates :infomation_id, presence: true
  validates :staff_id, presence: true, uniqueness: { scope: :infomation_id }
end
