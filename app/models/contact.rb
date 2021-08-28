class Contact < ApplicationRecord
  validates :name, presence: true, length: {in: 2..20}
  validates :message, presence: true, length: {in: 2..200}
  validates :email, presence: true, format: {with: /\A\S+@\S+\.\S+\z/}
  validates :phone_number, presence: true, format: {with: /\A[0-9]{10,11}\z/}, numericality: {only_integer: true}
end
