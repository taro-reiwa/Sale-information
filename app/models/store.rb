class Store < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 255 }
  
  has_many :sales, dependent: :destroy
end
