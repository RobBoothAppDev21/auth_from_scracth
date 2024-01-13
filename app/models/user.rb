# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }

  generates_token_for :password_reset, expires_in: 2.hours do
    password_salt&.last(10)
  end

  # generates_token_for :email_confirmation, expires_in: 24.hours do
  #   email
  # end
end
