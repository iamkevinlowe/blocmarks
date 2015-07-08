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
    topic: topics.sample)
end
bookmarks = Bookmark.all

puts "#{users.count} Users created"
puts "#{topics.count} Topics created"
puts "#{bookmarks.count} Bookmarks created"