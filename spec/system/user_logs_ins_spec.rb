require 'rails_helper'

RSpec.describe "User logs ins" do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    create(:user, username: "admin", password: "secretpassword")
    login_as(username: "admin", password: "secretpassword")
    expect(current_path).to eq(root_path)
    expect(page).to have_link "Abmelden", href: logout_path
  end

  it "unsuccessfully" do
    login_as(username: "admin", password: "secretpassword")
    expect(current_path).to eq(login_path)
    expect(page).to have_text "Ungültiger Benutzername oder Passwort!"
  end
end
