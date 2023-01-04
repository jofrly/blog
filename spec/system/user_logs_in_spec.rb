require 'rails_helper'

RSpec.describe 'User logs in' do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    create(:user, username: 'admin', password: 'secretpassword')
    login_as(username: 'admin', password: 'secretpassword')
    expect(page).to have_current_path(root_path, ignore_query: true)
    expect(page).to have_link 'Abmelden'
  end

  it 'unsuccessfully' do
    login_as(username: 'admin', password: 'secretpassword')
    expect(page).to have_current_path(login_path, ignore_query: true)
    expect(page).to have_text 'Ungültiger Benutzername oder Passwort!'
  end
end
