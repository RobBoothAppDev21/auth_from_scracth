# frozen_string_literal: true

class PasswordMailer < ApplicationMailer
  def password_reset
    mail to: params[:user].email
  end
end
