# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'registration' do
    context 'with personal user' do
      subject(:user) do
        # TODO: Create FactoryBot traits for each user role
        described_class.new(email: 'heralt.of.rivia@kaermorhen.org',
                            password: 'th3_w1tch3r',
                            confirmed_at: Time.zone.now)
      end

      it 'is expected to create a valid user' do
        expect(user).to be_valid
      end

      it 'is expected to be a person' do
        expect(user).to be_person
      end
    end

    context 'with team user' do
      subject(:team) do
        described_class.new(role: :team,
                            email: 'witchers@kaermorhen.org',
                            password: 'th3_w1tch3r5',
                            confirmed_at: Time.zone.now)
      end

      it 'is expected to create a valid user' do
        expect(team).to be_valid
      end

      it 'is expected to be a team' do
        expect(team).to be_team
      end
    end

    context 'with stock user' do
      subject(:stock) do
        described_class.new(role: :stock,
                            email: 'witchers.fundraising@kaermorhen.org',
                            password: 'th3_w1tch3r5_st0ck',
                            confirmed_at: Time.zone.now)
      end

      it 'is expected to create a valid user' do
        expect(stock).to be_valid
      end

      it 'is expected to be a stock' do
        expect(stock).to be_stock
      end
    end
  end
end
