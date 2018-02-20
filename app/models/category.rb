class Category < ApplicationRecord
    has_and_belongs_to_many :products

     # customer_id customer_first_name category_id category_name number_purchased
    # output example: 47 Maudi Audio 6
    def items_bought_per_category
        products_per_category = Product.select('products.id, categories.id, categories.name')
                                       .joins('JOIN categories_products ON products.id = categories_products.product_id')
                                       .joins('JOIN categories ON categories.id = categories_products.category_id').to_sql

        products_per_user = User.select('users.id, orders.id')
                                .joins('JOIN orders ON users.id = orders.user_id')
                                .joins('JOIN orders_products ON order.id = orders_products.order_id').to_sql

        products_per_category = Product.select('users.id, users.first_name, categories.id, category.name, COUNT(products.id)')
                                       .joins()
    end 
end


# User.select('users.id, users.first_name, categories.id, categories.name, COUNT(products.id)')
#     .joins('orders ON users.id = orders.user_id')
#     .joins('orders_products ON orders.id = orders_products.order_id')
#     .joins('products ON orders_products.product_id = products.id')
#     .joins('categories_products ON orders_products.product_id = categories_products.product_id')
#     .joins('categories ON categories_products.category_id = categories.id ')
#     .group('users.id, categories.name, categories.id')
#     .order('users.id')