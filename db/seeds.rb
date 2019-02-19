# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  },
  {
    name:         'Casse-bonbon',
    address:      '22 rue de Paris',
    age:           1,
    description:  'He was a star in tv show',
    city:         'Paris',
    price:         60
  },
  {
    name:         'La binocle',
    address:      '32 rue des arts',
    age:           2,
    description:  'Un petit roux à lunettes',
    city:         'Paris',
    price:         40
  },
  {
    name:         'Stewie',
    address:      '45 rue de Strasbourg',
    age:           1,
    description:  'Très intelligent et très méchant',
    city:         'Paris',
    price:         60
  },
  {
    name:         'Louis-Théodore',
    address:      '20 avenue Foch',
    age:           2,
    description:  'Le bébé le plus riche de Paris !',
    city:         'Paris',
    price:         80
  },
  {
    name:         'George',
    address:      '5 white horse street',
    age:           2,
    description:  'Futur king of England',
    city:         'Londres',
    price:         1000
  },
]
Baby.create(babies_attributes)
puts "Finished, we have #{Baby.count} babies."
