# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.transaction do
  User.create!(email: 'heralt.of.rivia@kaermorhen.org', password: 'th3_w1tch3r', confirmed_at: Time.zone.now)
end

# TODO: Add Person user
# TODO: Add Team user
# TODO: Add Stock user
