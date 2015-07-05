require 'faker'

larry = User.create!(username: "Larry", password: "worse")
curly = User.create!(username: "Curly", password: "terrible")
moe = User.create!(username: "Moe", password: "bad", contacts: [larry, curly])

message1 = Message.create!(text: Faker::Hacker.say_something_smart, sender: larry, recipients: [curly, moe])
message2 = Message.create!(text: Faker::Hacker.say_something_smart, sender: curly, recipients: [moe])
# user = User.create!(username: 'sam', password: '123')
# user2 = User.create!(username: 'bob', password: '234')
# message = Message.create!(text: 'Hello, World!', sender: user, recipients: [user2])
# user.contacts << user2
message3 = Message.create!(text: Faker::Hacker.say_something_smart, sender: moe, recipients: [curly])

Group.create!(name: "All Users", users: [larry, curly, moe])