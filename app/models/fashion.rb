class Fashion < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end