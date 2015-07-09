require 'faker'

# Create Users
user = User.new(
  name: 'User',
  email: 'user@example.com',
  password: 'helloworld'
  )
user.skip_confirmation!
user.save
user = User.new(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'helloworld'
  )
user.skip_confirmation!
user.save
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Topics
5.times do
  Topic.create(
    title: Faker::Lorem.word,
    user: users.sample)
end
topics = Topic.all

# Create Bookmarks
40.times do
  Bookmark.create(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample)
end
bookmarks = Bookmark.all

puts "#{users.count} Users created"
puts "#{topics.count} Topics created"
puts "#{bookmarks.count} Bookmarks created"