# frozen_string_literal: true

# app/controllers/refresh_controller.rb
class HomeController < ApplicationController
  def home
    @user = User.all

    render json: @user
  end
end
