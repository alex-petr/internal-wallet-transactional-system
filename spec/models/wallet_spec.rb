# frozen_string_literal: true

RSpec.describe Wallet, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'creation' do
    subject(:wallet) { build(:wallet) }

    it { is_expected.to be_valid }
    it('is expected wallet user to be valid') { expect(wallet.user).to be_valid }
  end
end
