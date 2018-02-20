# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Product.destroy_all
Order.destroy_all

# create users
jon = User.create(email: "jonchaney@gmail.com", first_name: "Jon", last_name: "Chaney", password_digest: "123456")
swayed = User.create(email: "swayedswayed@gmail.com", first_name: "Swayed", last_name: "Swayed", password_digest: "123456")
maudi = User.create(email: "maudi@gmail.com", first_name: "Maudi", last_name: "Guizar", password_digest: "123456")

# create categories
musical_instruments = Category.create(name: "Musical Instrument")
audio = Category.create(name: "Audio")
keyboard = Category.create(name: "Keyboard")
guitar = Category.create(name: "Guitar")
cables = Category.create(name: "Cables")

# create products
jazzmaster = Product.create(name: "Fender Jazzmaster", price: "999.99")
strat = Product.create(name: "Fender Strat", price: "999.99")
synth = Product.create(name: "Roland Juno 60", price: "2900.00")
mic = Product.create(name: "Sennheiser MD421 II", price: "379.95")
cv = Product.create(name: "CV/Gate Cable", price: "5.64")
xlr = Product.create(name: "XLR Cable", price: "10.99")
piano = Product.create(name: "Steinway Piano Model D", price: "98500.00")

# add products to categories
musical_instruments.products << jazzmaster
musical_instruments.products << strat
musical_instruments.products << piano
musical_instruments.products << piano
musical_instruments.products << synth
guitar.products << jazzmaster
guitar.products << strat
audio.products << mic
audio.products << xlr
keyboard.products << synth
keyboard.products << piano 
cables.products << xlr
cables.products << cv

# create orders
jon_order1 = Order.create(user_id: jon.id)
jon_order2 = Order.create(user_id: jon.id)
maudi_order1 = Order.create(user_id: maudi.id)
swayed_order1 = Order.create(user_id: swayed.id)

# add products to orders
jon_order1.products << strat
jon_order1.products << synth
jon_order1.products << xlr
jon_order2.products << mic
jon_order2.products << mic
jon_order2.products << mic
maudi_order1.products << xlr
maudi_order1.products << xlr
maudi_order1.products << xlr
maudi_order1.products << xlr
maudi_order1.products << xlr
maudi_order1.products << xlr
swayed_order1.products << cv
swayed_order1.products << mic
swayed_order1.products << cv
swayed_order1.products << cv

