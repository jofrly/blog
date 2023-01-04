def create_user_and_set_session
  user = create(:user, username: 'admin', password: 'secretpassword')
  request.session[:user_id] = user.id
  user
end

def create_user_and_login
  user = create(:user, username: 'admin', password: 'secretpassword')
  login_as(username: 'admin', password: 'secretpassword')
  user
end

def login_as(username:, password:)
  visit login_path
  fill_in 'Benutzername', with: username
  fill_in 'Passwort', with: password
  click_on 'Anmelden'
end
