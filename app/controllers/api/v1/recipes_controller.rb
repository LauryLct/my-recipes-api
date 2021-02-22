# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/recipes_controller.rb
    class RecipesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_recipe, only: %i[show update destroy]

      def index
        @recipes = current_user.recipes.all

        render json: @recipes
      end

      def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
          render json: @recipe, status: :created, location: @recipe
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @recipe
      end

      def update
        @recipe.update(recipe_params)
      end

      def destroy
        @recipe.destroy
      end

      private

      def recipe_params
        params.require(:recipe).permit(:name, :description)
      end

      def set_recipe
        @recipe = current_user.recipes.find(params[:id])
      end
    end
  end
end
