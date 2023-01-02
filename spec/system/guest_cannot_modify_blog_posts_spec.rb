require 'rails_helper'

RSpec.describe 'Guest cannot modify blog posts' do
  before do
    driven_by(:rack_test)
  end

  it 'cannot access the new action' do
    visit new_blog_post_path
    expect(page).to have_current_path(root_path, ignore_query: true)
  end

  it 'cannot access the create action' do
    post blog_posts_path
    expect(page).to have_current_path(root_path, ignore_query: true)
  end

  it 'cannot access the edit action' do
    post = create(:post)
    visit edit_blog_post_path(post)
    expect(page).to have_current_path(root_path, ignore_query: true)
  end

  it 'cannot access the update action' do
    patch blog_post_path('test')
    expect(page).to have_current_path(root_path, ignore_query: true)
  end

  it 'cannot access the destroy action' do
    delete blog_post_path('test')
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end
