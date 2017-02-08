# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(0...10).each do |i|
  user = User.new
  user.name = Faker::Name.name
  user.mail = Faker::Internet.email
  user.age = i < 5 ? rand(20...40) : rand(40...60)
  user.save
end

group = Group.new
group.name = "young"
group.save

group = Group.new
group.name = "old"
group.save


# Join groups with users
User.all.each do |x|
  if x.age < 40
    x.group_ids = 1
  else
    x.group_ids = 2
  end
end

# Set post
Post.create({user_id: 5, title: Faker::Lorem.sentence, content: Faker::Lorem
.paragraph})

# Set likes
post = Post.first
Group.first.users.each do |x|
  post.likes.create({user_id: x.id})
end

# Set comments
Group.last.users.each do |x|
  post.comments.create({user_id: x.id, content: Faker::Lorem.sentence})
end
