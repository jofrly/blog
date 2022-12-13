if User.find_by(username: ENV.fetch("ADMIN_USERNAME")).blank?
  User.create(username: ENV.fetch("ADMIN_USERNAME"), password: ENV.fetch("ADMIN_PASSWORD"))
end
