require 'rails_helper'

RSpec.describe 'User can destroy blog post' do
  before do
    driven_by(:selenium_headless)
  end

  it 'successfully' do
    create_user_and_login
    create(:post, title: 'First post', content: 'This is the content of the first post.')
    visit root_path
    click_link 'First post'
    click_link 'Bearbeiten'
    click_button 'Löschen'
    accept_confirm
    expect(page).not_to have_text 'First post'
    expect(page).not_to have_text 'This is the content of the first post.'
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end
