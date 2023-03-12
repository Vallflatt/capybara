# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
#Booking.destroy_all if Rails.env.development?
#Article.destroy_all if Rails.env.development?
Booking.destroy_all
Article.destroy_all
User.destroy_all

puts "after destroy"

#puts "count user: #{User.count}"
#puts "count booking: #{Booking.count}"
#puts "count article: #{Article.count}"

vallflatt = User.create!(
  email: 'vallflatt@gmail.com',
  username: 'vallflatt',
  password: '123456'
)

bibi = User.create!(
  email: 'vivipfeif@gmail.com',
  username: 'bibi82',
  password: '123456'
)

faked = []
5.times do
  faked.push(User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: '123456'
  ))
end

puts "count user: #{User.count}"

# -------------------------------
#       Article seeder
# -------------------------------

file = URI.open("https://www.jumbo.ch/img/products/930Wx620H/6469945_001.jpg")
perceuse = Article.new(
  name: 'perceuse/visseuse 18V Bosch',
  description: 'Cette perceuse-visseuse fiable et efficace vous accompagnera dans tous vos travaux.',
  street: 'ch des bossons 31',
  city: 'Lausanne',
  zipcode: 1018,
  available: true,
  user: vallflatt
)
perceuse.photo.attach(io: file, filename: "perceuse.jpg", content_type: "image/jpg")
perceuse.save

file = URI.open("https://images.kkeu.de/is/image/BEG/%C3%89chelles_et_%C3%A9chafaudages/Escabeaux/Escabeau_%C3%A0_marches_acc%C3%A8s_un_c%C3%B4t%C3%A9_pdplarge-mrd--945300_AFS_00_00_00_9897135.jpg?wid=390&hei=390")
escabeau = Article.new(
  name: 'escabeau à marches EUROKRAFTpro',
  description: "Montants et marches indéformables en profilés d'aluminium. Sertissage multiple robuste. Distance entre marches 235 mm.
  A partir de 7 marches, avec sangles robustes.
  Bac porte-outils grand format.",
  street: 'route de Broye 10',
  city: 'Prilly',
  zipcode: 1008,
  available: true,
  user: vallflatt
)
escabeau.photo.attach(io: file, filename: "escabeau.jpg", content_type: "image/jpg")
escabeau.save

file = URI.open("https://images.kkeu.de/is/image/BEG/Outils_%C3%A0_main/Marteaux/Marteau_de_serrurier_forme_fran%C3%A7aise_pdplarge-mrd--640765_AFS_00_00_00_5943427.jpg?wid=390&hei=390")
marteau = Article.new(
  name: 'Marteau de serrurier, KS Tools',
  description: "Avec manche en fibre de verre Version forgée",
  street: 'ch. de pallin 19',
  city: 'Pully',
  zipcode: 1009,
  available: true,
  user: vallflatt
)
marteau.photo.attach(io: file, filename: "marteau.jpg", content_type: "image/jpg")
marteau.save

file = URI.open("https://images.kkeu.de/is/image/BEG/Machines_de_nettoyage/Nettoyeurs_haute_pression/Nettoyeur_haute_pression_%C3%A0_eau_chaude_HDS_8_18-4C_pdplarge-mrd--000039186449_PRD_org_all.jpg?wid=390&hei=390")
karcher = Article.new(
  name: 'Kärcher Nettoyeur haute pression à eau chaude HDS 8/18-4C',
  description: "Cet appareil triphasé à moteur à 4 pôles refroidi à l'eau répond à toutes les exigences en matière de confort d'utilisation, d'ergonomie et d'exploitation efficace des ressources naturelles. La commande facile au moyen d'un seul bouton vous convaincra tout autant que la mobilité étonnamment élevée que procurent les grandes roues et la roulette pivotante.",
  street: 'av. de France 2',
  city: 'Lausanne',
  zipcode: 1004,
  available: true,
  user: faked.sample
)
karcher.photo.attach(io: file, filename: "karcher.jpg", content_type: "image/jpg")
karcher.save

file = URI.open("https://www.bettybossi.ch/static/angebote/25829/25829_a_f.jpg")
fer = Article.new(
  name: 'Fer à bricelets',
  description: "Quatre bricelets fins et dorés d'un coup, entretien facile grâce au revêtement antiadhésif",
  street: 'Ch. de Perréaz 51',
  city: 'Prilly',
  zipcode: 1008,
  available: true,
  user: faked.sample
)
fer.photo.attach(io: file, filename: "fer.jpg", content_type: "image/jpg")
fer.save

file = URI.open("https://www.pearl.ch/images/product_images/info_images/nx7589_2.jpg")
sac_couchage = Article.new(
  name: 'Sac de couchage sarcophage 3 saisons 300 g/m²',
  description: "Idéal pour le camping estival, ce sac de couchage 3 saisons est également parfaitement adapté aux nuits plus fraîches du printemps et de l'automne.",
  street: 'Avenue de la Rochelle 5',
  city: 'Prilly',
  zipcode: 1008,
  available: true,
  user: faked.sample
)
sac_couchage.photo.attach(io: file, filename: "sac_couchage.jpg", content_type: "image/jpg")
sac_couchage.save

file = URI.open("https://www.galaxus.ch/im/Files/5/2/6/0/6/2692_0.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high")
ponceuse = Article.new(
  name: 'Ponceuse excentrique, 220 W, Bosch',
  description: "La ponceuse orbitale Bosch PEX 220 A avec un moteur puissant de 220 watts assure un ponçage fin avec des performances de ponçage élevées et offre les meilleurs résultats, même pendant le polissage",
  street: 'Avenue de Lavaux 36',
  city: 'Pully',
  zipcode: 1009,
  available: true,
  user: faked.sample
)
ponceuse.photo.attach(io: file, filename: "ponceuse.jpg", content_type: "image/jpg")
ponceuse.save

puts "count article: #{Article.count}"

# -------------------------------
#       Booking seeder
# -------------------------------

Booking.create!(
  start_date: "2023-03-15",
  end_date: "2023-03-16",
  status: :confirmed,
  user: bibi,
  article: perceuse
)

Booking.create!(
  start_date: "2023-03-25",
  end_date: "2023-03-27",
  status: :pending,
  user: bibi,
  article: perceuse
)

Booking.create!(
  start_date: "2023-03-29",
  end_date: "2023-03-30",
  status: :finished,
  user: bibi,
  article: perceuse
)

Booking.create!(
  start_date: "2023-04-02",
  end_date: "2023-04-05",
  status: :confirmed,
  user: faked.sample,
  article: escabeau
)

Booking.create!(
  start_date: "2023-05-01",
  end_date: "2023-05-03",
  status: :declined,
  user: faked.sample,
  article: escabeau
)

puts "count booking: #{Booking.count}"
