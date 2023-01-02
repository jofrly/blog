require 'rails_helper'

RSpec.describe 'Guest cannot modify blog posts' do
  before do
    driven_by(:rack_test)
  end

  it 'cannot visit the new route' do
    visit new_blog_post_path
    expect(page).to have_current_path(root_path, ignore_query: true)
  end

  it 'cannot visit the update route' do
    post = create(:post)
    visit edit_blog_post_path(post)
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end
