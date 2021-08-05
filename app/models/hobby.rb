class Hobby < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :name, :comment, presence: true
end
