class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fashion

  has_rich_text :comment
end
