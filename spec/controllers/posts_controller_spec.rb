require 'rails_helper'

RSpec.describe PostsController do
  render_views

  describe 'index' do
    it 'shows the create button for authenticated users' do
      create_user_and_set_session

      get :index
      expect(response.body).to have_link 'Erstellen', href: new_blog_post_path
    end

    it 'hides the create button for unauthenticated users' do
      get :index
      expect(response.body).not_to have_link 'Erstellen', href: new_blog_post_path
    end
  end

  describe 'show' do
    it 'shows the edit button for authenticated users' do
      create_user_and_set_session

      post = create(:post)
      get :show, params: { id: post }
      expect(response.body).to have_link 'Bearbeiten', href: edit_blog_post_path(post)
    end

    it 'hides the edit button for unauthenticated users' do
      post = create(:post)
      get :show, params: { id: post }
      expect(response.body).not_to have_link 'Bearbeiten', href: edit_blog_post_path(post)
    end
  end
end
