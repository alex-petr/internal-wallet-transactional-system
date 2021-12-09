# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  # TODO: Devise config: define `root_url` to *something*, example: `root to: "home#index"`
end
