# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rental.destroy_all
Tool.destroy_all
User.destroy_all


categories = [{
  name: 'Drills'},{
  name: 'Saws'},{
  name: "Lights"},{
  name: "Generators"},{
  name: "Fans and Blowers"},{
  name: "Lights"},{
  name: "Hand Tools"},{
  name: "Welding"},{
  name: "Safety Gear"},{
  name: "Storage"},{
  name: "Machinery"},{
  name: "Accessories"},{
  name: "Other"
}]

Category.create(categories)

users = [
  {
    first_name: 'Admin',
    last_name: 'User',
    password: 'admin',
    email: 'admin@admin.com',
    address: '98 Butterfield Street, Herston',
    tools: Tool.create([
                         {
                           price: 10,
                           name: 'Drill',
                           brand: 'Makhita',
                           model: 'MD101',
                           description: 'Do in ullamco proident elit pariatur eiusmod veniam ex cillum excepteur ex magna. Amet aute aliqua enim eiusmod reprehenderit occaecat proident irure. Voluptate deserunt dolore do sit irure sunt excepteur quis exercitation consequat occaecat do proident. Est aliqua aliqua in amet excepteur incididunt aliquip.',
                           availability: true,
                           delivery_options: 'Delivery',
                           delivery_fee: 1.50,
                           min_delivery_fee: 15.00
                         },
                         {
                           price: 20,
                           name: 'Chainsaw',
                           brand: 'Makhita',
                           model: 'MC201',
                           description: 'Do in ullamco proident elit pariatur eiusmod veniam ex cillum excepteur ex magna. Amet aute aliqua enim eiusmod reprehenderit occaecat proident irure. Voluptate deserunt dolore do sit irure sunt excepteur quis exercitation consequat occaecat do proident. Est aliqua aliqua in amet excepteur incididunt aliquip.',
                           availability: true,
                           delivery_options: 'Pickup',
                           delivery_fee: 2.50,
                           min_delivery_fee: 10.00
                         }
                       ])
  },
  {
    first_name: 'Jeff',
    last_name: 'Smith',
    password: 'password',
    email: 'jeff@gmail.com',
    address: '60 Gloucester Street, Spring Hill',
    tools: Tool.create([
                         {
                           price: 15,
                           name: 'Drill',
                           brand: 'Sharp',
                           model: 'SD333',
                           description: 'Do in ullamco proident elit pariatur eiusmod veniam ex cillum excepteur ex magna. Amet aute aliqua enim eiusmod reprehenderit occaecat proident irure. Voluptate deserunt dolore do sit irure sunt excepteur quis exercitation consequat occaecat do proident. Est aliqua aliqua in amet excepteur incididunt aliquip.',
                           availability: true,
                           delivery_options: 'Both',
                           delivery_fee: 0.50,
                           min_delivery_fee: 5.00
        
                         },
                         {
                           price: 30,
                           name: 'Roller',
                           brand: 'Bosch',
                           model: 'BR401',
                           description: 'Do in ullamco proident elit pariatur eiusmod veniam ex cillum excepteur ex magna. Amet aute aliqua enim eiusmod reprehenderit occaecat proident irure. Voluptate deserunt dolore do sit irure sunt excepteur quis exercitation consequat occaecat do proident. Est aliqua aliqua in amet excepteur incididunt aliquip.',
                           availability: true,
                           delivery_options: 'Delivery',
                           delivery_fee: 10.00,
                           min_delivery_fee: 100.00
                         }
                       ])
  },
  { first_name: 'John',
    last_name: 'Gregory',
    password: '123abc',
    email: 'john@gmail.com',
    address: '3 Queen Street, Brisbane'}
]

User.create(users)

User.first.add_role(:admin)
User.first.add_role(:renter)
User.first.add_role(:owner)
User.second.add_role(:owner)
User.last.add_role(:renter)

# User.first.rentals.create!(
#   start_date: Date.new(2019, 12, 12),
#   end_date: Date.new(2019, 12, 15),
#   returned: false,
#   tool: Tool.last,
#   price: 200
# )

# Santiago owned rental from jeff epstein
# Past rental - jeff can update, santiago can't.
User.last.rentals.create!(
  start_date: Date.new(2019, 10, 10),
  end_date: Date.new(2019, 10, 13),
  returned: false,
  delivery_option: 'Pickup',
  price: 10,
  tool: Tool.third
)
# Jeff owned rental from Ben
# Current Rental - neither can edit or delete.
User.second.rentals.create!(
  start_date: Date.today,
  end_date: Date.today + 3.days,
  returned: false,
  delivery_option: 'Delivery',
  price: 10,
  tool: Tool.first
)

# Santiago owned rental from Jeff
# Future Rental - both can delete.
User.last.rentals.create!(
  start_date: Date.new(2019, 11, 20),
  end_date: Date.new(2019, 11, 24),
  returned: false,
  delivery_option: 'Pickup',
  price: 10,
  tool: Tool.third
)

# User.first.rentals.create!(
#   start_date: Date.new(2019, 12, 12),
#   end_date: Date.new(2019, 12, 15),
#   returned: false,
#   tool: Tool.last
# )
