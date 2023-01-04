require 'rails_helper'

RSpec.describe 'Guest can see landingpage' do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    visit root_path
    expect(page).not_to have_link 'Abmelden'
  end
end
