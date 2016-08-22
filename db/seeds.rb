color = %w(Red Blue Yellow Green Purple)

5.times do |i|
	status = i == 0 || i == 2 ? true : false
	App.create(name: "App#{i+1}", description: "Application #{i+1}", color: color[i], status: status)
end

3.times do |i|
	User.create(login: "user#{i+1}", password_digest: BCrypt::Password.create('glbrcpass'))
end

User.all.each { |user| user.apps += [App.first, App.third] }
