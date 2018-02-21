class OrdersController < ApplicationController
    def index
        @orders = User.find(params[:id]).orders
        render json: @orders.as_json
    end 

    def sales_breakdown
        time_span = params['time_span']

        start_time = Date::strptime(params['start'], "%m/%d/%Y")
        end_time = Date::strptime(params['end'], "%m/%d/%Y")

        # get orders in date range
        # @orders = Order.('created_at BETWEEN ? AND ?', start_time, end_time)

        case time_span
        when 'day'
            Order.select('to_char(orders.created_at, 'MM/DD/YY') AS day, products.name AS product_name, COUNT(products.name) AS number_sold')
            .joins()
        when 'week'
                  
        when 'month'
            
        end 
        render json: results.as_json
    end 
end


# SELECT to_char(orders.created_at, 'MM/DD/YY') AS day, products.name AS product_name, COUNT(products.name) AS number_sold 
# FROM orders 
# JOIN orders_proproducts.order_id 
# JOIN products ON orders_products.product_id = products.id 
# WHERE orders.created_at <@ tsrange(orders.created_at,orders.created_at) 
# GROUP BY orders.created_at, products.name;