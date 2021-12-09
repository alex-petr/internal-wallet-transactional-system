# frozen_string_literal: true

RSpec.configure do |config|
  # Config https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rspec
  config.include FactoryBot::Syntax::Methods
  # Fix ActiveRecord::AssociationTypeMismatch error when creating a factory with associations for `spring`
  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rails-preloaders-and-rspec
  config.before(:suite) { FactoryBot.reload }
end
