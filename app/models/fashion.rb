class Fashion < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_rich_text :other
  has_rich_text :description

  validates :image, presence: true

  def like_count
    likes.count
  end
end