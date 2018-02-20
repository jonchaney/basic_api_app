class Category < ApplicationRecord
    has_and_belongs_to_many :products

    def items_bought_per_category
        sql = User.select('users.id AS user_id, users.first_name, categories.id AS category_id, categories.name, COUNT(products.id)')
        .joins('JOIN orders ON users.id = orders.user_id')
        .joins('JOIN orders_products ON orders.id = orders_products.order_id')
        .joins('JOIN products ON orders_products.product_id = products.id')
        .joins('JOIN categories_products ON orders_products.product_id = categories_products.product_id')
        .joins('JOIN categories ON categories_products.category_id = categories.id ')
        .group('users.id, categories.id, categories.name')
        .order('users.id').to_sql

        ActiveRecord::Base.connection.exec_query(sql)
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