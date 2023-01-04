require 'rails_helper'

RSpec.describe 'Guest can see blog posts' do
  before do
    driven_by(:rack_test)
  end

  describe 'as a list' do
    it 'can see the posts' do
      post = create(:post, :with_long_content, title: 'First post')
      create(:post, title: 'Second post', content: 'This is the content of the second post.')

      visit root_path
      expect(page).to have_text 'First post'
      expect(page).to have_text post.content.to_plain_text.truncate(350)
      expect(page).to have_text 'Second post'
      expect(page).to have_text 'This is the content of the second post.'
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
