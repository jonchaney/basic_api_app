# Basic API App

Technologies used 

- Rails
- Postgres database
- Postman for testing

# assumptions / what I would accomplish with more time

This is an ecommerce app requiring api endpoints to gather sales data both on individual users and on products over a span of time. It also requires an endpoint that gathers all the orders made by a customer. I made the assumption that this would be used on a complex database where multiple products have many overlapping categories. I designed my seed file to reflect this. 


 The API endpoint that accepts a date range and a day, week, or month and returns a breakdown of products sold by quantity per day/week/month.
- I designed the end point to return all Products if no params are present. 
- If you include the time_span (day, week, month), start and end dates of the date range it returns a sales_breakdown. If you include a csv param set to true it writes that information to a csv file.
- With more time I would have the endpoint accept an options hash that would allow the endpoint more flexibility in what data is returned. eg: if only a start date and a time_span is provided have it return the data from that start point up to the current date.
- I would also reconsider the placement of the sales_breakdown at the index function of the products controller. This route could possibly be directed to its own function so the index route could be used just to get all Products. Or we could create a new Controller that is used specifically to gather sales data.

# where answers are located

- First SQL query is located in a function in the User Model (ORM) and the SQL version in the folder /sql.
- The API endpoint that accepts a date range and a day, week, or month is located in the Products Controller and the CSV files are exported to /assets
- The API endpoint that returns all the orders for a customer is in the Users Controller.


# additional questions

I. We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

The stories for this feature are:

    a product belongs to a list
    a list has many products
    a user has many lists

To implement this I would create a simple join table called lists_products. The pro of this is I would not have to change any other tables for it to work. I would only have to add associations. The con is you now have a new model and controller that is incredibly similar to the Orders model and controller that acts as a holding place until an Order is placed.

Another possible approach to this problem would be to check for a 'pending' option on the Order 'status' column. If the option is 'pending' then it is a List or an order that has not been made yet. When that order is processed it moves to "waiting for delivery." Because a user has many orders, this would allow the User to create 'Lists' that could be processed as orders. The pro of this is we would not have to create any new tables, models or controllers. The con is we would have to check for a status of "pending." Also calling the orders a "list" on the frontend could be confusing for other developers.

II. If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?

Example:

Store X apples inventory = 6

Customer A wants 4 apples
Customer B wants 3 apples

To prevent both customers checking these items out at the same time we could decrease the inventory when a customer has those items in their cart.

Customer A puts 4 apples into their cart. Now Store X inventory is 2.

Customer B now only see's 2 apples as available.

The con to this is when a customer A has an order that has not been checked out decides not to place the order. This would keep Customer B from buying the amount of items they want becuase they in customer B's order. Another bigger problem would be the number of database requests being made to change a stores inventory if customers keep adding and removing items to their cart. 

A better approach would be to just process all the orders in the order they are received and if an item runs out trigger an 'item no longer available' error message and suggest a similar item they may want instead. 

