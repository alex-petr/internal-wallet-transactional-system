# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,
         :rememberable, :trackable, :timeoutable, :validatable, :lockable

  enum role: { person: 0, team: 1, stock: 2 }
end
