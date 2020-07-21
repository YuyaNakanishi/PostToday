class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  
  validates :avatar, presence: true
  validates :nickname, presence: true
  validates :introduction, presence: true
  
  has_rich_text :introduction
end

