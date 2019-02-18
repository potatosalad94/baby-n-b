# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# Baby.destroy_all

# puts 'Creating babies...'
# Baby.create(name: "Jack-Jack", age: 1, description: "Best baby on earth", city: "Paris", address: "16 villa gaudelet")

# puts "Finished, we have #{Baby.count} babies"
puts 'Cleaning database...'
Baby.destroy_all

puts 'Creating babies...'
babies_attributes = [
  {
    name:         'Jack-Jack',
    address:      '1 rue de Lille',
    age:           2,
    description:  'best baby on earth',
    city:         'Paris',
    price:         30
  },
  {
    name:         'Maggie',
    address:      '1 rue Oberkampf',
    age:          2,
    description:  'worst baby on earth',
    city:         'Paris',
    price:         40
  }
]
Baby.create(babies_attributes)
puts "Finished, we have #{Baby.count} babies : #{Baby.name}  "
