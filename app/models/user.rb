class User < ApplicationRecord

  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_secure_password validations: false
  validates :password, presence: true, length: { minimum: 6 }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true,
    length: { maximum: 64 },
    format: { with: VALID_EMAIL_FORMAT },
    uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }
end
