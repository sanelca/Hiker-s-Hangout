require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Testing posts" do
    it "With all data" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      post = Post.new(content: "sdkjashg dshdkasg", user_id: 1).save
      expect(post).to eq(true)
    end
    it "Without content" do
      post = Post.new(content: "").save
      expect(post).to eq(false)
    end
    it "Without user_id" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      post = Post.new(content: "sdkjashg dshdkasg").save
      expect(post).to eq(false)
    end
  end
end
