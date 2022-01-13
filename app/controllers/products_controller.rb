# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  include ProductHelper
  protect_from_forgery prepend: true
  before_action :find_product, only: [:update]

  def index
    @product = Product.all
    render json: @product, only: %i[name code price]
  end

  def update
    if @product.update(price_params)
      render json: @product, only: %i[name code price]
    else
      render json: @product.errors
    end
  end

  def check_price
    price = 0.0
    params[:items].each do |item|
      price += price_of_item(item.upcase)
    end
    render json: price
  end

  def offer
    total = calculate_price(params[:items])
    render json: total
  end

  private

  def price_params
    params.require(:product).permit(:price)
  end

  def find_product
    @product = Product.where(id: params[:id]).first
  end
end
