# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.belongs_to :user
      # TODO: balance float (cumulative after each transaction) https://github.com/magnusvk/counter_culture

      t.timestamps
    end
  end
end
