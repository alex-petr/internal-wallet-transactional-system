# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'registration' do
    subject(:user) do
      described_class.new(email: 'heralt.of.rivia@kaermorhen.org',
                          password: 'th3_w1tch3r',
                          confirmed_at: Time.zone.now)
    end

    it 'is expected to create a valid user' do
      expect(user).to be_valid
    end
  end
end
