# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :recipes, dependent: :destroy
end
