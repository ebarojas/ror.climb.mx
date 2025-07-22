class Subscriber < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 100 }
  validates :about, length: { maximum: 280 }

  scope :verified, -> { where(verified: true) }
  scope :unverified, -> { where(verified: false) }
end
