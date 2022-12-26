require 'rails_helper'

RSpec.describe "User can create blog post" do
  before do
    driven_by(:selenium_headless)
  end

  it "successfully" do
    create_user_and_login
    visit new_blog_post_path
    fill_in "Titel", with: "Post title"
    fill_in_trix_editor "Post content"
    click_on "Erstellen"
    expect(Post.first).to_not be_nil
    expect(current_path).to eq(blog_post_path("post-title"))
    expect(page).to have_text("Post title")
    expect(page).to have_text("Post content")
  end

  it "unsuccessfully" do
    create_user_and_login
    visit new_blog_post_path
    click_on "Erstellen"
    expect(Post.first).to be_nil
    expect(page).to have_text("Titel muss ausgefüllt werden")
    expect(page).to have_text("Inhalt muss ausgefüllt werden")
    expect(page).to have_text("Slug muss ausgefüllt werden")
  end
end
