# frozen_string_literal: true

# hepler for Product
module ProductHelper
  def calculate_price(items)
    mug_offer(items) + tshirt_offer(items) + (price_of_item('HOODIE') * items.count('HOODIE'))
  end

  def mug_offer(items)
    count = items.count('MUG')
    count >= 2 ? ((count - 1) * price_of_item('MUG')) : (price_of_item('MUG') * count)
  end

  def tshirt_offer(items)
    count = items.count('TSHIRT')
    count >= 3 ? priceafter_discount(count) : (price_of_item('TSHIRT') * count)
  end

  def priceafter_discount(count)
    discount_price = (price_of_item('TSHIRT') * count) * 30 / 100
    ((price_of_item('TSHIRT') * count) - discount_price)
  end

  def price_of_item(item)
    Product.where(code: item).last.price
  end
end
