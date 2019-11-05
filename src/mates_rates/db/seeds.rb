# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Rental.destroy_all
Tool.destroy_all


users = [
  {
  first_name: 'Ben',
  last_name: 'Ulcoq',
  password: 'n8baodawd87',
  email: 'spam.ulcoq@gmail.com',
  address: '123 Herbert Way, Brisbane',
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
    last_name: 'Epstein',
    password: 'nfb3oywd87',
    email: 'jeffpring@gmail.com',
    address: '123 Murderered place, Suicidenot',
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
    }])
    }
  ]

  User.create(users)

  User.first.add_role('admin')

  User.first.rentals.create!(
    start_date: Date.new(2019,12,12),
    end_date: Date.new(2019,12,15),
    returned: false,
    tool: Tool.last
  )

  User.last.rentals.create!(
    start_date: Date.new(2019,12,13),
    end_date: Date.new(2019,12,18),
    returned: false,
    tool: Tool.first
  )

  User.first.rentals.create!(
    start_date: Date.new(2019,12,12),
    end_date: Date.new(2019,12,15),
    returned: false,
    tool: Tool.last
  )