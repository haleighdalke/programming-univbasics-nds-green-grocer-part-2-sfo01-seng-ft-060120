require_relative './part_1_solution.rb'

# takes coupons and cart, returns a new cart with coupons applied
def apply_coupons(cart, coupons)
  new_cart = []
  cart.each do |grocery_item|
    modified = false

    coupons.each do |coupon_item|
      if grocery_item[:item] == coupon_item[:item] && grocery_item[:count] >= coupon_item[:num]

        discount_item = {
          :item => "#{grocery_item[:item].upcase} W/COUPON",
          :price => coupon_item[:cost] / coupon_item[:num],
          :clearance => grocery_item[:clearance],
          :count => coupon_item[:num]
        }
        grocery_item[:count] -= coupon_item[:num]

        new_cart.push(discount_item)
        new_cart.push(grocery_item)
        modified = true
      end
    end
    if !modified
      new_cart.push(grocery_item)
    end
  end
  new_cart
end

# takes cart and returns same cart with 20% discount applied to "clearance" items
def apply_clearance(cart)
  cart.each do |item|
    if item[:clearance]
      item[:price] = item[:price] - item[:price] * 0.2
    end
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers

  new_cart = consolidate_cart(cart)
  new_cart = apply_coupons(new_cart, coupons)
  new_cart = apply_clearance(new_cart)

  total = 0
  new_cart.each do |item|
    total += item[:price] * item[:count]
  end

  if total >= 100
    total = total - total*0.10
  end

  total
end
