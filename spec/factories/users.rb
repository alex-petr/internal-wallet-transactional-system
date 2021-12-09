# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'p@55w0rd' }
    confirmed_at { Time.zone.now }

    trait :with_person_role do
      role { :person }
      email { 'heralt.of.rivia@kaermorhen.org' }
      password { 'th3_w1tch3r' }
    end

    trait :with_team_role do
      role { :team }
      email { 'witchers@kaermorhen.org' }
      password { 'th3_w1tch3r5' }
    end

    trait :with_stock_role do
      role { :stock }
      email { 'witchers.fundraising@kaermorhen.org' }
      password { 'th3_w1tch3r5_st0ck' }
    end
  end
end
