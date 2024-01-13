# frozen_string_literal: true

class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_by(sessions_params)
      login(user)
      redirect_to root_path, notice: "You have signed in successfully"
    else
      flash[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "You have been logged out!"
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end