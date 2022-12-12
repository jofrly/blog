require 'rails_helper'

RSpec.describe "User logs ins", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows the user to login" do
    User.create(username: "admin", password: "secretpassword")

    visit login_path
    fill_in "Benutzername", with: "admin"
    fill_in "Passwort", with: "secretpassword"
    click_on "Anmelden"
    expect(page).to have_link "Abmelden", href: logout_path
  end
end
