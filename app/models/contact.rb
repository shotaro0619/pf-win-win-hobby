class Contact < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, :phone_number, :message, presence: true
  validates :phone_number, numericality: { only_integer: true }
end
