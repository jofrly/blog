require 'rails_helper'

RSpec.describe "User can update blog post" do
  before do
    driven_by(:selenium_headless)
  end

  it "successfully" do
    create_user_and_login
    post = create(:post, title: "First post", content: "This is the content of the first post.")
    visit edit_blog_post_path(post)
    fill_in "Titel", with: "Updated title"
    fill_in_trix_editor "Updated content"
    click_on "Speichern"
    expect(current_path).to eq(blog_post_path(post))
    expect(page).to have_text("Updated title")
    expect(page).to have_text("Updated content")
  end

  it "unsuccessfully" do
    create_user_and_login
    post = create(:post, title: "First post", content: "This is the content of the first post.")
    visit edit_blog_post_path(post)
    fill_in "Titel", with: ""
    clear_trix_editor
    click_on "Speichern"
    expect(current_path).to eq(edit_blog_post_path(post))
    expect(page).to have_text("Titel muss ausgefüllt werden")
    expect(page).to have_text("Inhalt muss ausgefüllt werden")
  end
end
