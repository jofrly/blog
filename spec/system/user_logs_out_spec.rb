require 'rails_helper'

RSpec.describe "User logs out", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    create(:user, username: "admin", password: "secretpassword")
    login_as(username: "admin", password: "secretpassword")

    visit logout_path
    expect(page).to_not have_link "Abmelden", href: logout_path
  end
end
