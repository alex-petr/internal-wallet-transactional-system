# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user
  # TODO: balance float (cumulative after each transaction) https://github.com/magnusvk/counter_culture
end
