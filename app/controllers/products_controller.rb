class ProductsController < ApplicationController

    def index
        if params['time_span']
            @products = sales_breakdown
        else 
            @products = Product.all
        end
        render json: @products.as_json
    end 

    private
    def sales_breakdown
        time_span = params['time_span']

        start_time = Date::strptime(params['start'], "%m/%d/%Y")
        end_time = Date::strptime(params['end'], "%m/%d/%Y")

        if time_span == 'day'
            @products = Product.select('products.id, EXTRACT(DAY FROM orders.created_at)::integer as day, products.name, COUNT(products.id) AS quantity_sold')
               .joins('JOIN orders_products ON products.id = orders_products.product_id')
               .joins('JOIN orders ON orders.id = orders_products.order_id')
               .where('orders.created_at BETWEEN ? AND ?', start_time, end_time)
               .group("products.name, products.id, EXTRACT(DAY FROM orders.created_at)")
        elsif time_span == 'week'
            @products = Product.select('products.id, EXTRACT(WEEK FROM orders.created_at)::integer as week, products.name, COUNT(products.id) AS quantity_sold')
               .joins('JOIN orders_products ON products.id = orders_products.product_id')
               .joins('JOIN orders ON orders.id = orders_products.order_id')
               .where('orders.created_at BETWEEN ? AND ?', start_time, end_time)
               .group("products.name, products.id, EXTRACT(WEEK FROM orders.created_at)")
        elsif time_span == 'month'
            @products = Product.select('products.id, EXTRACT(MONTH FROM orders.created_at)::integer as month, products.name, COUNT(products.id) AS quantity_sold')
               .joins('JOIN orders_products ON products.id = orders_products.product_id')
               .joins('JOIN orders ON orders.id = orders_products.order_id')
               .where('orders.created_at BETWEEN ? AND ?', start_time, end_time)
               .group("products.name, products.id, EXTRACT(MONTH FROM orders.created_at)")
        end 
        
        if params['csv']
            CSV.open("app/assets/sales-breakdown-#{start_time}-to-#{end_time}-per-#{time_span}.csv", "wb") do |csv|
                csv << ["id","name", "price", "#{time_span}", "quantity_sold"]
                @products.all.each do |product|
                csv << product.attributes.values
                end
            end
        end
        
        @products
    end 
end
