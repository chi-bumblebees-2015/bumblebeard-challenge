require_relative '../app'

describe "Users" do
  it "has three users with the correct usernames" do
    usernames = User.all.order(:username).map(&:username)

    expect(usernames).to eq ["Curly", "Larry", "Moe"]
  end

  it "all three users have passwords" do
    passwords = User.all.order(:password).map(&:password)

    expect(passwords.all? {|i| i != nil}).to be true
  end

end

describe "Moe" do
  it "has Larry and Curly as contacts" do
    moe = User.find_by(username: "Moe")
    contacts = moe.contacts.order(:username).map(&:username)
    expect(contacts).to eq ["Curly", "Larry"]
  end

end

describe "#contacts_info" do
  let(:moe) { User.find_by(username: "Moe") }
  it "returns an array" do
    expect(moe.contacts_info).to be_an Array
  end

  it "of hash objects" do
    expect(moe.contacts_info.all? {|i| i.class == Hash}).to be true
  end

  it "denies access to a user's password" do
    expect(moe.contacts_info.first[:password]).to be nil
  end

end
