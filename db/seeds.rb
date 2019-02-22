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

puts 'Creating user...'
flo = User.create(first_name: "Flo", last_name: "Flo", email: "flo@gmail.com", password: "123456")

puts 'Creating babies...'
jack = Baby.new({
    name:         'Jack-Jack',
    age:           2,
    description:  'Best baby on earth',
    address:      '20 avenue Parmentiers',
    city:         'Paris',
    price:         30,
    user: flo
  })
url = "http://www.writeups.org/wp-content/uploads/Jack-Jack-The-Incredibles-baby-a.jpg"
jack.remote_photo_url = url
jack.save!

maggie = Baby.new({
    name:         'Maggie',
    address:      '1 rue Oberkampf',
    age:          2,
    description:  'Worst baby on earth',
    city:         'Paris',
    price:         40,
    user: flo
  })
url = "http://img09.deviantart.net/da86/i/2015/149/4/2/maggie_simpson__the_simpsons__by_frasier_and_niles-d8v7g2o.jpg"
maggie.remote_photo_url = url
maggie.save!

casse_bonbon = Baby.new({
    name:         'Casse-bonbon',
    address:      '22 rue de Paris',
    age:           1,
    description:  'He was a star in tv show',
    city:         'Paris',
    price:         60,
    user: flo
  })
url = "https://www.babelio.com/users/QUIZ_Quiz-a-tout-casser_676.jpeg"
casse_bonbon.remote_photo_url = url
casse_bonbon.save!

la_binocle = Baby.new({
    name:         'La binocle',
    address:      '30 avenue de la République',
    age:           2,
    description:  'Un petit roux à lunettes',
    city:         'Paris',
    price:         40,
    user: flo
  })
url = "http://superyo.nuxit.net/Razmoket/animaux/herbert-labi.jpg"
la_binocle.remote_photo_url = url
la_binocle.save!

stewie = Baby.new({
    name:         'Stewie',
    address:      '45 rue de Strasbourg',
    age:           1,
    description:  'Très intelligent et très méchant',
    city:         'Paris',
    price:         60,
    user: flo
  })
url = "https://i.pinimg.com/736x/93/78/d7/9378d7f7a105bcc008996a5f44bed6c7--stewie-griffin-family-guy.jpg"
stewie.remote_photo_url = url
stewie.save!

bebe_sans_photo = Baby.new({
    name:         'Rémi Sans Famille',
    address:      '41 quai Pierre Scize',
    age:           1,
    description:  'Bébé cherche famille',
    city:         'Lyon',
    price:         5,
    user: flo
  })
url = "https://i.stack.imgur.com/l60Hf.png"
bebe_sans_photo.remote_photo_url = url
bebe_sans_photo.save!

puts "Finished, we have #{Baby.count} babies."
