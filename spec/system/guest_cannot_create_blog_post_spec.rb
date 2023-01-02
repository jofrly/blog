require 'rails_helper'

RSpec.describe 'Guest cannot create blog post' do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    visit new_blog_post_path
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end
