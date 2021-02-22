# frozen_string_literal: true

# app/controllers/refresh_controller.rb
class HomeController < ApplicationController
  def home
    @recipe = Recipe.all
     render json: @recipe
  end
end
