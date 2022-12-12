require 'rails_helper'

RSpec.describe "User logs out" do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    create_user_and_login

    visit logout_path
    expect(page).to_not have_link "Abmelden", href: logout_path
  end
end
