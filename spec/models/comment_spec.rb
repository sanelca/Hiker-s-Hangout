require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Testing comments" do
    it "With all data" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      post = Post.new(content: "sdkjashg dshdkasg", user_id: 1).save
      comment = Comment.new(content: "Testing comments", post_id: 1, user_id: 1).save
      expect(comment).to eq(true)
    end
    it "Without user id" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      post = Post.new(content: "sdkjashg dshdkasg", user_id: 1).save
      comment = Comment.new(content: "Testing comments", post_id: 1).save
      expect(comment).to eq(false)
    end
    it "Without post id" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      comment = Comment.new(content: "Testing comments", user_id: 1).save
      expect(comment).to eq(false)
    end
  end

end
