require 'rails_helper'

RSpec.describe "User logs ins", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    User.create(username: "admin", password: "secretpassword")
    login_as(username: "admin", password: "secretpassword")
    expect(page).to have_link "Abmelden", href: logout_path
  end

  it "unsuccessfully" do
    login_as(username: "admin", password: "secretpassword")
    expect(page).to have_text "Ungültiger Benutzername oder Passwort!"
  end
end
