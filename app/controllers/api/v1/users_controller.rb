# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/users_controller.rb
    class UsersController < ApplicationController
      before_action :authorize_access_request!

      def create
        @user = User.new(params[:user])
        @user.password = params[:password]
        @user.save!
      end
    end
  end
end
