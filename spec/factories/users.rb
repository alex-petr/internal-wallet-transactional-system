# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # wallet
    # association :wallet, factory: :wallet

    # wallet do
    #   association(:wallet)
    # end

    # wallet { association(:wallet) }

    # the after(:create) yields two values; the user instance itself and the
    # evaluator, which stores all values from the factory, including transient
    # attributes; `create_list`'s second argument is the number of records
    # to create and we make sure the user is associated properly to the post
    after(:create) do |user, evaluator|
      create(:user, user: user)

      # You may need to reload the record here, depending on your application
      user.reload
    end

    # after(:create) do |team, evaluator|
    #   create(:user, team: team, user: evaluator.owner, default: true)
    # end

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
