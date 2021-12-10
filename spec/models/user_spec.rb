# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:wallet).dependent(:destroy) }
  end

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

  describe 'wallet creation' do
    subject(:user) { build(:user, :with_person_role) }
    # subject(:wallet) { build(:wallet) }

    # FIXME
    it('is expected wallet to be valid') { expect(user.wallet).to be_valid; ap user.wallet }
  end
end
