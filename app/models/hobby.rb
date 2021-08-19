class Hobby < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :name, :comment, :genre_id, presence: true
  validates :comment, length: {maximum: 180}
end
