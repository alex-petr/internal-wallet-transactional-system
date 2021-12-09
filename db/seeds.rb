# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def log_display_status(message)
  Rails.logger.info message.ai
  ap message # rubocop:disable Rails/Output
end

def create_user!(attributes)
  User.transaction do
    user = User.create!(attributes)
    log_display_status(message: 'User successfully created', attributes: attributes, record: user)
  end
rescue ActiveRecord::RecordInvalid => e
  log_display_status(message: 'User not created!', attributes: attributes, error: e, record: e.record)
end

create_user!(FactoryBot.attributes_for(:user, :with_person_role))
create_user!(FactoryBot.attributes_for(:user, :with_team_role))
create_user!(FactoryBot.attributes_for(:user, :with_stock_role))
