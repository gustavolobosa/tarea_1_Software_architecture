# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Limpiar datos existentes (opcional, úsalo con precaución)
# Author.destroy_all
# Book.destroy_all
# Review.destroy_all
# Sale.destroy_all

# Crear autores
10.times do
  Author.create(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 80),
    country_of_origin: Faker::Address.country,
    short_description: Faker::Lorem.paragraph(sentence_count: 2)
  )
end

# Crear libros
authors = Author.all
50.times do
  Book.create(
    name: Faker::Book.title,
    summary: Faker::Lorem.paragraph(sentence_count: 5),
    date_of_publication: Faker::Date.between(from: 50.years.ago, to: Date.today),
    number_of_sales: Faker::Number.between(from: 100, to: 1000),
    author: authors.sample
  )
end

# Crear reseñas
books = Book.all
100.times do
  Review.create(
    review: Faker::Lorem.paragraph(sentence_count: 3),
    score: Faker::Number.between(from: 1, to: 5),
    number_of_up_votes: Faker::Number.between(from: 0, to: 100),
    book: books.sample
  )
end

# Crear ventas por año
100.times do
  Sale.create(
    year: Faker::Number.between(from: 2000, to: Date.today.year),
    sales: Faker::Number.between(from: 100, to: 10000),
    book: books.sample
  )
end

puts "Datos falsos creados correctamente."