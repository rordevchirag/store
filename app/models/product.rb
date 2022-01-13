# frozen_string_literal: true

# ProductModule
class Product < ApplicationRecord
  validates :name, :price, :code, presence: true
  has_many :orders
end
