# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'registration' do
    context 'with personal user' do
      subject(:user) { build(:user, :with_person_role) }

      it { is_expected.to be_valid }
      it { is_expected.to be_person }
    end

    context 'with team user' do
      subject(:team) { build(:user, :with_team_role) }

      it { is_expected.to be_valid }
      it { is_expected.to be_team }
    end

    context 'with stock user' do
      subject(:stock) { build(:user, :with_stock_role) }

      it { is_expected.to be_valid }
      it { is_expected.to be_stock }
    end
  end
end
