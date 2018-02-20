class User < ApplicationRecord
    has_many :orders

    # customer_id customer_first_name category_id category_name number_purchased
    # output example: 47 Maudi Audio 6
    def items_bought_per_category
        self.orders.
    end 

end


# get categories
# print number of items bought for categories