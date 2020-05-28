require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  new_cart = consolidate_cart(cart)

  new_cart.each do |grocery_item|
    coupons.each do |coupon_item|
      if grocery_item[:item] == coupon_item[:item] && grocery_item[:clearance] == true

        discount_item = {
          :item => "#{grocery_item[:item].upcase} W/COUPON",
          :price => coupon_item[:cost] / coupon_item[:num],
          :clearance => true,
          :count => coupon_item[:num]
        }
        grocery_item[:count] -= coupon_item[:num]

        new_cart.push(discount_item)

        binding.pry
      end
    end
  end
  binding.pry
  new_cart
end

cart_test = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "KALE", :price => 3.00, :clearance => false},
  {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
  {:item => "ALMONDS", :price => 9.00, :clearance => false},
  {:item => "TEMPEH", :price => 3.00, :clearance => true},
  {:item => "CHEESE", :price => 6.50, :clearance => false},
  {:item => "BEER", :price => 13.00, :clearance => false},
  {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
  {:item => "BEETS", :price => 2.50, :clearance => false},
  {:item => "SOY MILK", :price => 4.50, :clearance => true}
]

coupons_test = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

cart_test = consolidate_cart(cart_test)
apply_coupons(cart_test, coupons_test)









def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
