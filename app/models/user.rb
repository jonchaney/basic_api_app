class User < ApplicationRecord
    has_many :orders

    private
    def self.items_bought_per_category
        sql = User.select('users.id AS user_id, users.first_name, categories.id AS category_id, categories.name, COUNT(products.id)')
        .joins('JOIN orders ON users.id = orders.user_id')
        .joins('JOIN orders_products ON orders.id = orders_products.order_id')
        .joins('JOIN products ON orders_products.product_id = products.id')
        .joins('JOIN categories_products ON orders_products.product_id = categories_products.product_id')
        .joins('JOIN categories ON categories_products.category_id = categories.id ')
        .group('users.id, categories.id, categories.name')
        .order('users.id')

        ActiveRecord::Base.connection.exec_query(sql)
    end 

end
