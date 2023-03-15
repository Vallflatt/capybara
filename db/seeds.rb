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

lbevo = User.create!(
  email: 'lb@syw.ch',
  username: 'lbevo',
  password: '123456'
)

ddlh = User.create!(
  email: 'ddlh@google.ch',
  username: 'ddlh',
  password: '123456'
)

robin = User.create!(
  email: 'rgoodyear@gmail.com',
  username: 'robin',
  password: '123456'
)

faus_teen = User.create!(
  email: 'faufourcad@gmail.com',
  username: 'faus_teen',
  password: '123456'
)

reberman = User.create!(
  email: 'sven.reb@gmail.com',
  username: 'reberman',
  password: '123456'
)

adri_the_man = User.create!(
  email: 'adritheman@gmail.com',
  username: 'adri_the_man',
  password: '1234566'
)

jul_lambilly = User.create!(
  email: 'jul.lamby@gmail.com',
  username: 'jul_lambilly',
  password: '123456'
)

rom_isoz = User.create!(
  email: 'rom.isoz99@caramail.com',
  username: 'rom_isoz',
  password: '123456'
)

thibo_wagon = User.create!(
  email: 'tibo.j@lewagon.ch',
  username: 'thibo_wagon',
  password: '123456'
)

monica_geller = User.create!(
  email: 'monica.geller@hotmail.com',
  username: 'monica.geller',
  password: '123456'
)

joey_tribbiani = User.create!(
  email: 'joey.tribbiani@gmail.com',
  username: 'joey_tribbiani',
  password: '123456'
)

phoebe_buffay = User.create!(
  email: 'phoebe.buffay@outthere.com',
  username: 'phoebs',
  password: '123456'
)

# faked = []
# 5.times do
#   faked.push(User.create!(
#     email: Faker::Internet.email,
#     username: Faker::Internet.username,
#     password: '123456'
#   ))
# end

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
  street: 'ch des bossons 31',
  city: 'Lausanne',
  zipcode: 1018,
  available: true,
  user: vallflatt
)
escabeau.photo.attach(io: file, filename: "escabeau.jpg", content_type: "image/jpg")
escabeau.save

file = URI.open("https://images.kkeu.de/is/image/BEG/Outils_%C3%A0_main/Marteaux/Marteau_de_serrurier_forme_fran%C3%A7aise_pdplarge-mrd--640765_AFS_00_00_00_5943427.jpg?wid=390&hei=390")
marteau = Article.new(
  name: 'marteau de serrurier, KS Tools',
  description: "Avec manche en fibre de verre Version forgée",
  street: 'ch des bossons 31',
  city: 'Lausanne',
  zipcode: 1018,
  available: true,
  user: vallflatt
)
marteau.photo.attach(io: file, filename: "marteau.jpg", content_type: "image/jpg")
marteau.save

file = URI.open("https://images.kkeu.de/is/image/BEG/Machines_de_nettoyage/Nettoyeurs_haute_pression/Nettoyeur_haute_pression_%C3%A0_eau_chaude_HDS_8_18-4C_pdplarge-mrd--000039186449_PRD_org_all.jpg?wid=390&hei=390")
karcher = Article.new(
  name: 'kärcher Nettoyeur haute pression à eau chaude ',
  description: "facile d'utilisation au moyen d'un seul bouton",
  street: 'av. de France 2',
  city: 'Lausanne',
  zipcode: 1004,
  available: true,
  user: reberman
)
karcher.photo.attach(io: file, filename: "karcher.jpg", content_type: "image/jpg")
karcher.save

file = URI.open("https://www.bettybossi.ch/static/angebote/25829/25829_a_f.jpg")
fer = Article.new(
  name: 'fer à bricelets',
  description: "Quatre bricelets fins et dorés d'un coup, entretien facile grâce au revêtement antiadhésif",
  street: 'Av. de France 2',
  city: 'Lausanne',
  zipcode: 1004,
  available: true,
  user: reberman
)
fer.photo.attach(io: file, filename: "fer.jpg", content_type: "image/jpg")
fer.save

file = URI.open("https://www.anibis.ch/fr/d-m%c3%a9nage-~-maison-autres--682/centrale-vapeur-braun--47087213.aspx?fts=centrale+vapeur&pi=1&ps=20&pr=1")
centrale_vapeur = Article.new(
  name: "centrale vapeur",
  description: "centrale vapeur Braun CareStyle Compact",
  street: 'Av. de France 2',
  zipcode: 1004,
  available: true,
  user: reberman
)
centrale_vapeur.photo.attach(io: file, filename: "centrale-vapeur.jpg", content_type: "image/jpg")
centrale_vapeur.save

file = URI.open("https://can01.anibis.ch/Robots-de-cuisine-Robot-de-cuisine-Kenwood/?512x384/3/60/anibis/368/899/046/tmmKhNe2FUS_JCXYCa8pKQ_1.jpg")
robot_cuisine_kenwood = Article.new(
  name: "robot de cuisine Kenwood",
  description: "Kenwood KM070 avec accessoires, bien utilisé mais dure une vie! ",
  street: 'Av. de France 2',
  zipcode: 1004,
  available: true,
  user: reberman
)

robot_cuisine_kenwood.photo.attach(io: file, filename: "robot-kenwood.jpg", content_type: "image/jpg")
robot_cuisine_kenwood.save

file = URI.open("https://www.pearl.ch/images/product_images/info_images/nx7589_2.jpg")
sac_couchage = Article.new(
  name: 'sac de couchage sarcophage 3 saisons 300 g/m²',
  description: "Idéal pour le camping estival, ce sac de couchage 3 saisons est également parfaitement adapté aux nuits plus fraîches du printemps et de l'automne.",
  street: 'Avenue de la Rochelle 5',
  city: 'Prilly',
  zipcode: 1008,
  available: true,
  user: adri_the_man
)
sac_couchage.photo.attach(io: file, filename: "sac_couchage.jpg", content_type: "image/jpg")
sac_couchage.save

file = URI.open("https://www.galaxus.ch/im/Files/5/2/6/0/6/2692_0.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high")
ponceuse = Article.new(
  name: 'ponceuse excentrique, 220 W, Bosch',
  description: "La ponceuse orbitale Bosch PEX 220 A avec un moteur puissant de 220 watts assure un ponçage fin avec des performances de ponçage élevées et offre les meilleurs résultats, même pendant le polissage",
  street: 'Avenue de la Rochelle 5',
  city: 'Prilly',
  zipcode: 1009,
  available: true,
  user: adri_the_man
)
ponceuse.photo.attach(io: file, filename: "ponceuse.jpg", content_type: "image/jpg")
ponceuse.save

file = URI.open("https://can01.anibis.ch/Tondeuses-a-gazon-Tondeuse-a-gazon-Honda/?512x384/3/60/anibis/741/321/047/uXfTbRgPKk6ZktOlbGdfOA_1.jpg")
tondeuse_honda = Article.new(
  name: 'tondeuse à gazon Honda',
  description: "de 2005, bon fonctionnement mais usée HRG415C2 SDE",
  street: 'Avenue de la Rochelle 5',
  city: 'Prilly',
  zipcode: 1009,
  available: true,
  user: adri_the_man
)

tondeuse_honda.photo.attach(io: file, filename: "tondeuse-honda.jpg", content_type: "image/jpg")
tondeuse_honda.save

file = URI.open("https://can01.anibis.ch/Autres-Machine-a-pain/?512x384/3/60/anibis/881/348/047/xT1xxhRp902vNsPZ90CIug_1.jpg")
machine_a_pain_adri = Article.new(
  name: 'machine à pain',
  description: "neuve et très puissante pour cuire parfaitement toutes sortes de pains.",
  street: 'Avenue de la Rochelle 5',
  city: 'Prilly',
  zipcode: 1009,
  available: true,
  user: adri_the_man
)

machine_a_pain_adri.photo.attach(io: file, filename: "machine-a-pain-adri.jpg")
machine_a_pain_adri.save

file = URI.open("https://www.123comparer.fr/photoProd/zoom/918/kitchen-chef-kcwood-8-rp-126971.jpg")
four_a_raclette = Article.new(
  name: 'four à raclette 8 postes',
  description: 'Très bien entretenu, 220V prise suisse',
  street: 'Route de Broye 10',
  city: 'Prilly',
  zipcode: 1008,
  available: true,
  user: lbevo
)
four_a_raclette.photo.attach(io:file, filename: 'four-a-raclette.jpg', content_type: "image/jpg")
four_a_raclette.save

file = URI.open("https://imtc.qccdn.fr/test/nettoyeur-de-vitres/produit/karcher-wv2-homeline_001.jpg")
nettoyeur_vitres = Article.new(
  name: "nettoyeur à vitres",
  description: "hyper pratique pour les vitres très sales",
  street: "Route de broye 10",
  city: "Prilly",
  zipcode: 1009,
  available: true,
  user: lbevo
)
nettoyeur_vitres.photo.attach(io:file, filename: 'nettoyeur-vitres.jpg', content_type: "image/jpg")
nettoyeur_vitres.save

file = URI.open("https://can01.anibis.ch/Perceuses-Perceuse-a-percussion/?512x384/3/60/anibis/526/113/047/9eprZj9jgUKGsINlnfbraA_1.jpg")
perceuse_a_percu_lb = Article.new(
  name: "perceuse à percussion",
  description: "Perceuse Bosch 750W",
  street: "Route de broye 10",
  city: "Prilly",
  zipcode: 1009,
  available: true,
  user: lbevo
)

perceuse_a_percu_lb.photo.attach(io:file, filename: 'perceuse-percu-lb.jpg', content_type: "image/jpg")
perceuse_a_percu_lb.save

file = URI.open("https://can01.anibis.ch/Marteaux-Marteaux---masses/?512x384/3/60/anibis/014/346/047/vO1KGbh4AUWKgNM_Je-aAA_1.jpg")
marteaux_masses_lb = Article.new(
  name: "marteaux et masses",
  description: "6 marteaux et masses de tailles diverses, usés mais fonctionnels",
  street: "Route de broye 10",
  city: "Prilly",
  zipcode: 1009,
  available: true,
  user: lbevo
)

marteaux_masses_lb.photo.attach(io:file, filename: 'marteaux-lb.jpg', content_type: "image/jpg")
marteaux_masses_lb.save

file = URI.open("https://can01.anibis.ch/Autres-Karcher-haute-pression-390/?1024x768/3/60/anibis/030/198/047/oEpXkOYch0CrQwWVjDQI-A_1.jpg")
karcher_lb = Article.new(
  name: "kärcher super efficace",
  description: "haute pression 390 pour nettoyage efficace",
  street: "Route de broye 10",
  city: "Prilly",
  zipcode: 1009,
  available: true,
  user: lbevo
)

karcher_lb.photo.attach(io:file, filename: 'karcher-lb.jpg', content_type: "image/jpg")
karcher_lb.save

file = URI.open("https://static.fnac-static.com/multimedia/Images/FR/NR/e8/4c/78/7884008/1505-1/tsp20160505120343/Machine-a-pain-dore-Moulinex-OW210130-720W-1kg-Blanc.jpg")
machine_a_pain_ddlh = Article.new(
  name: "machine à pain",
  description: "fonctionne parfaitement bien",
  street: "Rue des Côtes-de-Montbenon 14",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: ddlh
)

machine_a_pain_ddlh.photo.attach(io:file, filename: 'machine-pain-ddlh.jpg', content_type: "image/jpg")
machine_a_pain_ddlh.save

file = URI.open("https://media.conforama.fr/m/export/Medias/700000/00000/1000/500/10/G_701511_A.jpg")
centrale_vapeur_ddlh = Article.new(
  name: "centrale vapeur",
  description: "on gagne un temps fou avec ça",
  street: "Rue des Côtes-de-Montbenon 14",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: ddlh
)

centrale_vapeur_ddlh.photo.attach(io:file, filename: 'centrale-vapeur-ddlh.jpg', content_type: "image/jpg")
centrale_vapeur_ddlh.save

file = URI.open("https://cdn.hornbach.ch/data/shop/D04/001/780/492/006/644/DV_8_10419976_01_4c_NL_20210313221655.jpg")
scie_sauteuse_ddlh = Article.new(
  name: "scie sauteuse Makita",
  description: "Scie sauteuse pendulaire Makita Scie sauteuse pendulaire sans fil 18V sans batterie ni chargeur",
  street: "Rue des Côtes-de-Montbenon 14",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: ddlh
)

scie_sauteuse_ddlh.photo.attach(io:file, filename: 'scie-sauteuse-ddlh.jpg', content_type: "image/jpg")
scie_sauteuse_ddlh.save

file = URI.open("https://can01.anibis.ch/Echelles-echelle-telescopique/?512x384/3/60/anibis/807/312/047/M5OJch3oWE2kr6dAucvDxQ_1.jpg")
echelle_telescop_ddlh = Article.new(
  name: "échelle télescopique",
  description: "en aluminium  2.5 mètres jusqu'à 3 mètres",
  street: "Rue des Côtes-de-Montbenon 14",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: ddlh
)

echelle_telescop_ddlh.photo.attach(io:file, filename: 'echelle-telescop-ddlh.jpg', content_type: "image/jpg")
echelle_telescop_ddlh.save

file = URI.open("https://www.lehner-versand.ch/media/catalog/product/cache/207e23213cf636ccdef205098cf3c8a3/5/5/5509902-ohmex-kuchenmaschine-rot-55099-1-w.jpg")
robot_cuisine_faustine = Article.new(
  name: "robot de cuisine",
  description: "marque Ohmex, très pratique",
  street: "route de chavannes 117",
  city: "Lausanne",
  zipcode: 1007,
  available: true,
  user: faus_teen
)

robot_cuisine_faustine.photo.attach(io:file, filename: 'robot-cuisine-faust.jpg', content_type: "image/jpg")
robot_cuisine_faustine.save

file = URI.open("https://stockli.shop/wp-content/uploads/2020/02/7421.14HAA-768x512.jpg")
caquelon_faustine = Article.new(
  name: "caquelon à fondue",
  description: "pour une super soirée entre amis avec un verre de blanc",
  street: "route de chavannes 117",
  city: "Lausanne",
  zipcode: 1007,
  available: true,
  user: faus_teen
)

caquelon_faustine.photo.attach(io:file, filename: 'caquelon-fondue-faust.jpg', content_type: "image/jpg")
caquelon_faustine.save

file = URI.open("https://can01.anibis.ch/Autres-Machine-a-pain/?512x384/3/60/anibis/095/299/047/zzcMNo8JBUSXYoKV_SLVqg_1.jpg")
machine_a_pain_faustine = Article.new(
  name: "machine à pain",
  description: "toute petite et efficace ",
  street: "route de chavannes 117",
  city: "Lausanne",
  zipcode: 1007,
  available: true,
  user: faus_teen
)

machine_a_pain_faustine.photo.attach(io:file, filename: 'machine-pain-faust.jpg', content_type: "image/jpg")
machine_a_pain_faustine.save

file = URI.open("https://can01.anibis.ch/Echelles-Echelle-1m65/?1024x768/3/60/anibis/087/114/047/J7X2zCnKHUyAspJX3zPUCA_1.jpg")
echelle_faustine = Article.new(
  name: "échelle 1m65",
  description: "stable, mais un peu sale",
  street: "route de chavannes 117",
  city: "Lausanne",
  zipcode: 1007,
  available: true,
  user: faus_teen
)

echelle_faustine.photo.attach(io:file, filename: 'echelle-faust.jpg', content_type: "image/jpg")
echelle_faustine.save

file = URI.open("https://can01.anibis.ch/Perceuses-Perceuse-Einhell-TE-RH-26-1-4F---272856/?1024x768/3/60/anibis/120/340/047/YGVuPJ-ZjkOjPpu1cUX0sg_1.jpg")
perceuse_puissante_jul = Article.new(
  name: "perceuse puissante",
  description: "Einhell TE-RH 26/1 4F / 272856",
  street: "Rue du Bugnon 1",
  city: "Renens",
  zipcode: 1020,
  available: true,
  user: jul_lambilly
)

perceuse_puissante_jul.photo.attach(io:file, filename: 'perceuse-jul.jpg', content_type: "image/jpg")
perceuse_puissante_jul.save

file = URI.open("https://can01.anibis.ch/Scies-Scie-a-bois-neuf/?512x384/3/60/anibis/551/793/046/9oMTmvDvF0Oy01nXA4VlJA_1.jpg")
scie_a_bois_jul = Article.new(
  name: "scie à bois",
  description: "deux scies à bois neuves",
  street: "Rue du Bugnon 1",
  city: "Renens",
  zipcode: 1020,
  available: true,
  user: jul_lambilly
)

scie_a_bois_jul.photo.attach(io:file, filename: 'scie-bois-jul.jpg', content_type: "image/jpg")
scie_a_bois_jul.save

file = URI.open("https://can01.anibis.ch/Echelles-Echelle-en-alu/?512x384/3/60/anibis/427/103/047/JJHFmh3zDUOHsY7R-JkTmw_1.jpg")
echelle_alu_jul = Article.new(
  name: "échelle en alu",
  description: "presque neuve, hauteur 1.65 m",
  street: "Rue du Bugnon 1",
  city: "Renens",
  zipcode: 1020,
  available: true,
  user: jul_lambilly
)

echelle_alu_jul.photo.attach(io:file, filename: 'echelle-jul.jpg', content_type: "image/jpg")
echelle_alu_jul.save

file = URI.open("https://lashampouineuse.com/wp-content/uploads/2020/03/A60.jpg")
shampouineuse_rom = Article.new(
  name: "shampouineuse pour moquette",
  description: "pratique pour éliminer efficacement les taches sur les textiles, moquettes, tapis",
  street: "Maisons Familiales 5",
  city: "Lausanne",
  zipcode: 1018,
  available: true,
  user: rom_isoz
)

shampouineuse_rom.photo.attach(io:file, filename: 'shampouin-rom.jpg', content_type: "image/jpg")
shampouineuse_rom.save

file = URI.open("https://can01.anibis.ch/Scier,-hacher---tronconner-une-scie-a-metal/?512x384/3/60/anibis/767/738/040/oW-cHGezg0yYcx7ZcOHFCw_1.jpg")
scie_metal_rom = Article.new(
  name: "scie à métaux",
  description: "avec des mèches neuves en réserve",
  street: "Maisons Familiales 5",
  city: "Lausanne",
  zipcode: 1018,
  available: true,
  user: rom_isoz
)

scie_metal_rom.photo.attach(io:file, filename: 'scie-metal-rom.jpg', content_type: "image/jpg")
scie_metal_rom.save

file = URI.open("https://can01.anibis.ch/Tondeuses-a-gazon-Tondeuse-a-gazon-manuelle/?512x384/3/60/anibis/443/359/045/ll7daBgekEWG2oZN5hc0-Q_1.jpg")
tondeuse_gazon_rom = Article.new(
  name: "tondeuse à gazon manuelle",
  description: "Plus toute jeune mais elle fait son job, permet de rester en forme aussi",
  street: "Maisons Familiales 5",
  city: "Lausanne",
  zipcode: 1018,
  available: true,
  user: rom_isoz
)

tondeuse_gazon_rom.photo.attach(io:file, filename: 'tondeuse-rom.jpg', content_type: "image/jpg")
tondeuse_gazon_rom.save

file = URI.open("https://can01.anibis.ch/Marteaux-Marteau---marteau-1kg-(Nouveau)/?512x384/3/60/anibis/803/532/045/KPAY_G4m9kyyp85VtDD9Ig_1.jpg")
marteau_thibo = Article.new(
  name: "marteau de paveur avec manche",
  description: "Marteau-pioche 1000g DEMA avec manche ergonomique",
  street: "Ch. de Perreaz 51",
  city: "Prilly",
  zipcode: 1008,
  available: true,
  user: thibo_wagon
)

marteau_thibo.photo.attach(io:file, filename: 'marteau-thibo.jpg', content_type: "image/jpg")
marteau_thibo.save

file = URI.open("https://can01.anibis.ch/Tondeuses-a-gazon-tondeuse-a-gazon-electrique/?512x384/3/60/anibis/451/120/045/z17nwlSaG0iwf52fk3_3cw_1.jpg")
tondeuse_thibo = Article.new(
  name: "tondeuse à gazon électrique",
  description: "plus écolo qu'une tondeuse à essence, Wolf E32",
  street: "Ch. de Perreaz 51",
  city: "Prilly",
  zipcode: 1008,
  available: true,
  user: thibo_wagon
)

tondeuse_thibo.photo.attach(io:file, filename: 'tondeuse-thibo.jpg', content_type: "image/jpg")
tondeuse_thibo.save

file = URI.open("https://can01.anibis.ch/Aspirateurs---accessoires-shampooineuse-aspirateur/?1024x768/3/60/anibis/259/738/046/3BBAhqGYP0WAodFSu63Psw_1.jpg")
shampouineuse_thibo = Article.new(
  name: "shampooineuse aspirateur",
  description: "petite schampoineuse brosseuse avec aspiration pour tapis",
  street: "Ch. de Perreaz 51",
  city: "Prilly",
  zipcode: 1008,
  available: true,
  user: thibo_wagon
)

shampouineuse_thibo.photo.attach(io:file, filename: 'shampouineuse-thibo.jpg', content_type: "image/jpg")
shampouineuse_thibo.save


file = URI.open("https://can01.anibis.ch/Cuivres---Etains-Bassine-a-confitures/?1024x768/3/60/anibis/397/910/046/_skCilkSI0KcEW_vkkBAXg_1.jpg")
bassine_confiture_monica = Article.new(
  name: "bassine à confitures",
  description: "en cuivre, diamètre sup. 35 cm. diamètre inf, 20 cm. hauteur 15 cm.",
  street: "Avenue de Lavaux 36",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: monica_geller
)

bassine_confiture_monica.photo.attach(io:file, filename: 'bassine-monica.jpg', content_type: "image/jpg")
bassine_confiture_monica.save

file = URI.open("https://can01.anibis.ch/Poncer---raboter-Ponceuse-Bosch/?512x384/3/60/anibis/404/010/047/lPJ8pX-1u0K8fPrw9TGIsw_1.jpg")
ponceuse_phoebe = Article.new(
  name: "ponceuse",
  description: "PRR 250ES pour gros travaux",
  street: "Rue des Terreaux 2",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: phoebe_buffay
)

ponceuse_phoebe.photo.attach(io:file, filename: 'ponceuse-phoebe.jpg', content_type: "image/jpg")
ponceuse_phoebe.save

file = URI.open("https://can01.anibis.ch/Autres-Magnifique-caquelon-A-Fondue-a-letat-neuf/?512x384/3/60/anibis/199/265/047/sNH_xU6L8EKqbAAeltgWfw_1.jpg")
caquelon_phoebe = Article.new(
  name: "caquelon à fondue",
  description: "Pour six à huit personnes en terre cuite renforcé",
  street: "Rue des Terreaux 2",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: phoebe_buffay
)

caquelon_phoebe.photo.attach(io:file, filename: 'caquelon-phoebe.jpg', content_type: "image/jpg")
caquelon_phoebe.save

file = URI.open("https://can01.anibis.ch/Scier,-hacher---tronconner-Scie-sauteuse/?512x384/3/60/anibis/134/519/029/o0K7OOL0NkSFRHB8Vt3enQ_1.jpg")
scie_sauteuse_phoebe = Article.new(
  name: "scie sauteuse",
  description: "Black & Decker",
  street: "Rue des Terreaux 2",
  city: "Lausanne",
  zipcode: 1003,
  available: true,
  user: phoebe_buffay
)

scie_sauteuse_phoebe.photo.attach(io:file, filename: 'scie-sauteuse-phoebe.jpg', content_type: "image/jpg")
scie_sauteuse_phoebe.save

file = URI.open("https://can01.anibis.ch/Scier,-hacher---tronconner-Scie-circulaire/?512x384/3/60/anibis/862/322/047/IdWy5pRP9k27aucVKLvFIg_1.jpg")
scie_circul_joey = Article.new(
  name: "scie circulaire",
  description: "Bosch, PKS 54",
  street: "Chemin du Fau-Blanc 15",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: joey_tribbiani
)

scie_circul_joey.photo.attach(io:file, filename: 'scie-circul-joey.jpg', content_type: "image/jpg")
scie_circul_joey.save

file = URI.open("https://can01.anibis.ch/Tondeuses-a-gazon-Tracteur-a-gazon-tondeuse-Cub-Cadet/?512x384/3/60/anibis/479/324/047/zMxMG30t40mCewabdDaEjA_1.jpg")
tondeuse_tracteur_joey = Article.new(
  name: "tondeuse à gazon tracteur",
  description: "pour tondre en restant assis: Tracteur Cub Cadet",
  street: "Chemin du Fau-Blanc 15",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: joey_tribbiani
)

tondeuse_tracteur_joey.photo.attach(io:file, filename: 'tondeuse-joey.jpg', content_type: "image/jpg")
tondeuse_tracteur_joey.save

file = URI.open("https://can01.anibis.ch/Autres-Four-a-raclette/?512x384/3/60/anibis/386/741/046/OSRZBIUDaUOr0j_dlof15Q_1.jpg")
four_raclette_joey = Article.new(
  name: "four à raclette 6 personnes",
  description: "avec 8 poêlons pour un repas festif entre Capys!",
  street: "Chemin du Fau-Blanc 15",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: joey_tribbiani
)

four_raclette_joey.photo.attach(io:file, filename: 'four-raclette-joey.jpg', content_type: "image/jpg")
four_raclette_joey.save

file = URI.open("https://can01.anibis.ch/Objets-de-decoration-Confiturier/?512x384/3/60/anibis/749/323/047/j7jbyYz9X0GNoPnACnNMZw_1.jpg")
bassine_confiture_joey = Article.new(
  name: "bassine à confitures",
  description: "en cuivre assez grande pour faire beaucoup de confiture!",
  street: "Chemin du Fau-Blanc 15",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: joey_tribbiani
)

bassine_confiture_joey.photo.attach(io:file, filename: 'bassine-confiture-joey.jpg', content_type: "image/jpg")
bassine_confiture_joey.save

file = URI.open("https://can01.anibis.ch/Autres-Fer-a-bricelet-Jura/?512x384/3/60/anibis/950/194/047/V1114kJhoUuiM0ztlQXt1A_1.jpg")
fer_bricelets_joey = Article.new(
  name: "fer à bricelets",
  description: "marque Jura, très haute qualité, les bricelets sont toujours réussis",
  street: "Chemin du Fau-Blanc 15",
  city: "Pully",
  zipcode: 1009,
  available: true,
  user: joey_tribbiani
)

fer_bricelets_joey.photo.attach(io:file, filename: 'fer-bricelets-joey.jpg', content_type: "image/jpg")
fer_bricelets_joey.save

file = URI.open("https://www.galaxus.ch/im/Files/5/3/1/8/0/0/3/2/22463_StarSense_Explorer_DX_6-SCT_06_570x3803x.jpg")
telescope_jul = Article.new(
  name: "téléscope professionnel Celestron StarSense",
  description: "modèle Explorer DX 6 SCT, facile à utiliser sans connaissances du ciel",
  street: "Rue du Bugnon 1",
  city: "Renens",
  zipcode: 1020,
  available: true,
  user: jul_lambilly
)

telescope_jul.photo.attach(io:file, filename: 'telescop-jul.jpg', content_type: "image/jpg")
telescope_jul.save

puts "count article: #{Article.count}"

# -------------------------------
#       Booking seeder
# -------------------------------

Booking.create!(
  start_date: "2023-03-17",
  end_date: "2023-03-18",
  status: :confirmed,
  user: bibi,
  article: perceuse,
  message: "hello, tu peux venir chercher le 16 au soir dès 19h"
)

Booking.create!(
  start_date: "2023-03-25",
  end_date: "2023-03-27",
  status: :pending,
  user: bibi,
  article: perceuse,
  message: "devant l'immeuble dès 8h le 25"
)

Booking.create!(
  start_date: "2023-03-29",
  end_date: "2023-03-30",
  status: :finished,
  user: bibi,
  article: perceuse,
  message: "merci!"
)

Booking.create!(
  start_date: "2023-04-02",
  end_date: "2023-04-05",
  status: :confirmed,
  user: lbevo,
  article: escabeau,
  message: "tu peux venir le 2 devant chez moi"
)

Booking.create!(
  start_date: "2023-05-01",
  end_date: "2023-05-03",
  status: :declined,
  user: faus_teen,
  article: escabeau,
  message: "désolée, j'en ai besoin sur ces dates là!"
)

puts "count booking: #{Booking.count}"
