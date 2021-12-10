# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { person: 0, team: 1, stock: 2 }

  has_one :wallet, dependent: :destroy

  # Include default devise modules. Others available are :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,
         :rememberable, :trackable, :timeoutable, :validatable, :lockable
end
