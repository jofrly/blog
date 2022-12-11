require 'rails_helper'

RSpec.describe "User logs ins", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows the user to login" do
    visit new_session_path
  end
end
