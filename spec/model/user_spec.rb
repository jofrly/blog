require "rails_helper"

RSpec.describe User do
  context "username" do
    it "is unique" do
      create(:user, username: "admin")
      second_user = build(:user, username: "admin")
      expect(second_user.valid?).to be_falsey
      expect(second_user.errors.full_messages.first).to eq("Username has already been taken")
    end

    it "is required" do
      second_user = build(:user, username: nil)
      expect(second_user.valid?).to be_falsey
      expect(second_user.errors.full_messages.first).to eq("Username can't be blank")
    end
  end

  context ".with_username" do
    it "returns a user or nil by case insensitive username" do
      user = create(:user, username: "admin")
      found_user = User.with_username("adMIN")
      expect(found_user).to eq(user)
    end

    it "returns nil if no user could be found" do
      found_user = User.with_username("adMIN")
      expect(found_user).to eq(nil)
    end
  end
end
