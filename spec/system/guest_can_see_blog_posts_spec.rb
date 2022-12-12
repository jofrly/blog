require 'rails_helper'

RSpec.describe "Guest can see blog posts" do
  before do
    driven_by(:rack_test)
  end

  it "as a list" do
    create(:post, title: "First post", content: "This is the content of the fist post.")
    create(:post, title: "Second post", content: "This is the content of the second post.")

    visit blog_posts_path
    expect(page).to have_text "First post"
    expect(page).to have_text "This is the content of the fist post."
    expect(page).to have_text "Second post"
    expect(page).to have_text "This is the content of the second post."
  end

  it "individually" do
    post = create(:post, title: "First post", content: "This is the content of the fist post.")

    visit blog_post_path(post)

    expect(page).to have_text "First post"
    expect(page).to have_text "This is the content of the fist post."
  end
end
