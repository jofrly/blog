require 'rails_helper'

RSpec.describe "User can destroy blog post" do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    create_user_and_login
    post = create(:post, title: "First post", content: "This is the content of the first post.")
    visit edit_blog_post_path(post)
    click_on "Löschen"
    expect(current_path).to eq(blog_posts_path)
    expect(page).to_not have_text "First post"
    expect(page).to_not have_text "This is the content of the first post."
  end
end
