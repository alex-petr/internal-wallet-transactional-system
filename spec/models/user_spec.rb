# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'registration' do
    context 'with personal user' do
      # TODO: Add shoulda-matchers
      subject(:user) { build(:user, :with_person_role) }

      it('is expected to create a valid user') { expect(user).to be_valid }
      it('is expected to be a person') { expect(user).to be_person }
    end

    context 'with team user' do
      subject(:team) { build(:user, :with_team_role) }

      it('is expected to create a valid user') { expect(team).to be_valid }
      it('is expected to be a team') { expect(team).to be_team }
    end

    context 'with stock user' do
      subject(:stock) { build(:user, :with_stock_role) }

      it('is expected to create a valid user') { expect(stock).to be_valid }
      it('is expected to be a stock') { expect(stock).to be_stock }
    end
  end
end
