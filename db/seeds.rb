# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = Catalog.create name: 'Books'
movies =  Catalog.create name: 'Movies'


books.products.create name: 'Clockwork Orange', description: 'Anti-utopia.'
books.products.create name: 'Wee Free Men', description: 'Fantasy, Comedy.'

movies.products.create name: 'Clockwork Orange', description: 'Anti-utopia.'
movies.products.create name: 'Pulp Fiction', description: 'Criminal, Comedy.'
movies.products.create name: 'Pulp Fiction', description: 'Second Fiction.'


Product.find(1).reviews.create message: 'Language is quite unique.'
Product.find(2).reviews.create message: 'Hilarious book.'
Product.find(3).reviews.create message: 'Epic dialogs.'


