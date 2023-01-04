require 'rails_helper'

RSpec.describe 'shared/_navbar' do
  it 'shows the logout button for authenticated users' do
    Current.user = create(:user)
    render
    expect(rendered).to have_link 'Abmelden', href: logout_path
  end

  it 'hides the logout button for unauthenticated users' do
    Current.user = Guest.new
    render
    expect(rendered).not_to have_link 'Abmelden', href: logout_path
  end
end
