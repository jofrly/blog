require 'rails_helper'

RSpec.describe 'Guest can see blog posts' do
  before do
    driven_by(:rack_test)
  end

  describe 'as a list' do
    it 'can see the posts' do
      create(:post, title: 'First post', content: 'This is the content of the first post.')
      create(:post, title: 'Second post', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' \
                                                   'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ' \
                                                   'enim ad minim veniam, quis nostrud exercitation ullamco laboris ' \
                                                   'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ' \
                                                   'in reprehenderit in voluptate velit esse cillum dolore eu fugiat ' \
                                                   'nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' \
                                                   'sunt in culpa qui officia deserunt mollit anim id est laborum.')

      visit root_path
      expect(page).to have_text 'First post'
      expect(page).to have_text 'This is the content of the first post.'
      expect(page).to have_text 'Second post'
      expect(page).to have_text 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ' \
                                'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ' \
                                'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute ' \
                                'irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla ' \
                                'pariatur. Excepteur si...'
    end

    it 'can not see the create button' do
      visit root_path
      expect(page).not_to have_link 'Erstellen'
    end
  end

  describe 'individually' do
    it 'can see the post' do
      create(:post, title: 'First post', content: 'This is the content of the first post.')

      visit root_path
      click_link 'First post'

      expect(page).to have_text 'First post'
      expect(page).to have_text 'This is the content of the first post.'
      expect(page).to have_title 'First post'
      expect(page).to have_meta 'description', 'This is the content of the first post.'
    end

    it 'can not see the edit button' do
      create(:post, title: 'First post', content: 'This is the content of the first post.')

      visit root_path
      click_link 'First post'
      expect(page).not_to have_link 'Bearbeiten'
    end
  end
end
