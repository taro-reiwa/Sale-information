class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :store
  
  validates :content, presence: true, length: { maximum: 255 }
end
