class UsersController < ApplicationController
    def orders
        @orders = User.find(params[:id]).orders
        render json: @orders.as_json
    end
end
