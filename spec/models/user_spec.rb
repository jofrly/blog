require 'rails_helper'

RSpec.describe User do
  context 'username' do
    it 'is unique' do
      create(:user, username: 'admin')
      second_user = build(:user, username: 'admin')
      expect(second_user).not_to be_valid
      expect(second_user.errors.full_messages.first).to eq('Benutzername ist bereits vergeben')
    end

    it 'is required' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages.first).to eq('Benutzername muss ausgefüllt werden')
    end
  end

  describe '.with_username' do
    it 'returns a user or nil by case insensitive username' do
      user = create(:user, username: 'admin')
      found_user = described_class.with_username('adMIN')
      expect(found_user).to eq(user)
    end

    it 'returns nil if no user could be found' do
      found_user = described_class.with_username('adMIN')
      expect(found_user).to be_nil
    end
  end
end
