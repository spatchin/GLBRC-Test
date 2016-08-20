# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
color = %w(Red Blue Yellow Green Purple)

5.times do |i|
	status = i == 0 || i == 2 ? true : false
	App.create(name: "App#{i+1}", description: "Application #{i+1}", color: color[i], status: status)
end

3.times do |i|
	User.create(login: "user#{i+1}", password_digest: BCrypt::Password.create('glbrcpass'))
end

User.all.each { |user| user.apps += [App.first, App.third] }
