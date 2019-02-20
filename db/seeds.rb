# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Baby.destroy_all
User.destroy_all

puts 'Creating babies...'

flo = User.create(first_name: "Flo", last_name: "Flo", email: "flo@gmail.com", password: "123456")




babies_attributes = [
  {
    name:         'Jack-Jack',
    address:      '1 rue de Lille',
    age:           2,
    description:  'best baby on earth',
    city:         'Paris',
    price:         30,
    user: flo
  },
  {
    name:         'Maggie',
    address:      '1 rue Oberkampf',
    age:          2,
    description:  'worst baby on earth',
    city:         'Paris',
    price:         40,
    user: flo
  },
  {
    name:         'Casse-bonbon',
    address:      '22 rue de Paris',
    age:           1,
    description:  'He was a star in tv show',
    city:         'Paris',
    price:         60,
    user: flo
  },
  {
    name:         'La binocle',
    address:      '32 rue des arts',
    age:           2,
    description:  'Un petit roux à lunettes',
    city:         'Paris',
    price:         40,
    user: flo
  },
  {
    name:         'Stewie',
    address:      '45 rue de Strasbourg',
    age:           1,
    description:  'Très intelligent et très méchant',
    city:         'Paris',
    price:         60,
    user: flo
  },
  {
    name:         'Louis-Théodore',
    address:      '20 avenue Foch',
    age:           2,
    description:  'Le bébé le plus riche de Paris !',
    city:         'Paris',
    price:         3000,
    user: flo
  },
  {
    name:         'George',
    address:      '5 white horse street',
    age:           2,
    description:  'Futur king of England',
    city:         'Londres',
    price:         1000,
    user: flo
  },
  {
    name:         'Al',
    address:      '20 avenue Clémenceau',
    age:           2,
    description:  'Il est gentil.',
    city:         'Paris',
    price:         65,
    user: flo
  },
  {
    name:         'Booba',
    address:      '5 rue de Verdun',
    age:           2,
    description:  'Le duc des bacs à sable',
    city:         'Paris',
    price:         200,
    user: flo
  },
]
Baby.create(babies_attributes)
puts "Finished, we have #{Baby.count} babies."
