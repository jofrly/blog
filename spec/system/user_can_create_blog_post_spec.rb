require 'rails_helper'

RSpec.describe 'User can create blog post' do
  before do
    driven_by(:selenium_headless)
  end

  it 'successfully' do
    create_user_and_login
    visit root_path
    click_link 'Erstellen'
    fill_in 'Titel', with: 'Post title'
    fill_in_trix_editor 'Post content'
    click_button 'Erstellen'
    expect(Post.first).not_to be_nil
    expect(page).to have_current_path(blog_post_path('post-title'), ignore_query: true)
    expect(page).to have_text('Post title')
    expect(page).to have_text('Post content')
  end

  it 'unsuccessfully' do
    create_user_and_login
    visit root_path
    click_link 'Erstellen'
    click_button 'Erstellen'
    expect(Post.first).to be_nil
    expect(page).to have_text('Titel muss ausgefüllt werden')
    expect(page).to have_text('Inhalt muss ausgefüllt werden')
    expect(page).not_to have_text('Slug muss ausgefüllt werden')
  end

  it 'can cancel' do
    create_user_and_login
    visit root_path
    click_link 'Erstellen'
    click_link 'Abbrechen'
    expect(page).to have_current_path(root_path, ignore_query: true)
    expect(Post.first).to be_nil
  end
end
