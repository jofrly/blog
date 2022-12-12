require 'rails_helper'

RSpec.describe "Guest can see blog posts" do
  before do
    driven_by(:rack_test)
  end

  it "as a list" do
    create(:post, title: "First post", body: "This is the body of the fist post.")
    create(:post, title: "Second post", body: "This is the body of the second post.")

    visit blog_posts_path
    expect(page).to have_text "First post"
    expect(page).to have_text "This is the body of the fist post."
    expect(page).to have_text "Second post"
    expect(page).to have_text "This is the body of the second post."
  end
end
