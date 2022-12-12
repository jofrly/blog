def login_as(username:, password:)
  visit login_path
  fill_in "Benutzername", with: username
  fill_in "Passwort", with: password
  click_on "Anmelden"
end
