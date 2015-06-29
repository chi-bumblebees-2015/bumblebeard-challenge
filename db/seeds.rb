larry = User.create!(username: "Larry", password: "worse")
curly = User.create!(username: "Curly", password: "terrible")
moe = User.create!(username: "Moe", password: "bad", contacts: [larry, curly])

# user = User.create!(username: 'sam', password: '123')
# user2 = User.create!(username: 'bob', password: '234')
# message = Message.create!(text: 'Hello, World!', sender: user, recipients: [user2])
# user.contacts << user2
