require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # take cart
  # search to see if a coupon applies to any items in cart
  # if it does, apply coupon by ...
    # adding a new cart item with discounted prices
    # updating old cart item with dicounted items subtracted from count
  # if it doesnt, move on to next coupon item
  # return updated cart

  # initialize a new cart
  # go through every item in cart
    # for every item in coupons,
      # search for it in cart, using find_item_by_name_in_collection(coupon, cart)
      # if not nil (ie if it exists)
        # new_item = {
        #           }
        # cart.push(new_item)
        #* cart count -= number of coupons applied
      # else
        # continue searching
    # add item in cart to new cart if it doesnt exist
  # return cart

#not using a new cart
  new_cart = []
  cart.each do |grocery_item|
    coupons.each do |coupon_item|
      if grocery_item[:item] == coupon_item[:item]

        discount_item = {
          :item => "#{grocery_item[:item].upcase} W/COUPON",
          :price => coupon_item[:cost] / coupon_item[:num],
          :clearance => grocery_item[:clearance],
          :count => coupon_item[:num]
        }
        grocery_item[:count] -= coupon_item[:num]

        new_cart.push(discount_item)
        new_cart.push(grocery_item)

        #binding.pry
      end
    end
  end
  #binding.pry
  cart
end

# ------- my tests ---------
# cart_test = [
#   {:item => "AVOCADO", :price => 3.00, :clearance => true},
#   {:item => "AVOCADO", :price => 3.00, :clearance => true},
#   {:item => "AVOCADO", :price => 3.00, :clearance => true},
#   {:item => "KALE", :price => 3.00, :clearance => false},
#   {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
#   {:item => "ALMONDS", :price => 9.00, :clearance => false},
#   {:item => "TEMPEH", :price => 3.00, :clearance => true},
#   {:item => "CHEESE", :price => 6.50, :clearance => false},
#   {:item => "CHEESE", :price => 6.50, :clearance => false},
#   {:item => "BEER", :price => 13.00, :clearance => false},
#   {:item => "BEER", :price => 13.00, :clearance => false},
#   {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
#   {:item => "BEETS", :price => 2.50, :clearance => false},
#   {:item => "SOY MILK", :price => 4.50, :clearance => true}
# ]
#
# coupons_test = [
#   {:item => "AVOCADO", :num => 2, :cost => 5.00},
#   {:item => "BEER", :num => 2, :cost => 20.00},
#   {:item => "CHEESE", :num => 3, :cost => 15.00}
# ]
#
# cart_test = consolidate_cart(cart_test)
# apply_coupons(cart_test, coupons_test)

# -------------------------------







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
