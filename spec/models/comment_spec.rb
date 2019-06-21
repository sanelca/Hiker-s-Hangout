require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create first_name: 'Sanel', last_name: 'Hodzic', email: 'sancho@test.com', password: 'istanbul', password_confirmation: 'istanbul' }
  let(:user1) { User.create first_name: 'Sanel1', last_name: 'Hodzic1', email: 'sancho1@test.com', password: 'istanbul', password_confirmation: 'istanbul' }

  let(:post1) { Post.create content: "sdkjashg dshdkasg", user_id: user.id }

  let(:comment) { Comment.new(content: "Testing comments", post_id: post1.id, user_id: user.id).save }
  let(:comment1) { Comment.new(content: "Testing comments", post_id: "", user_id: user.id).save }
  let(:comment2) { Comment.new(content: "Testing comments", post_id: post1.id, user_id: "").save }

  context "Testing comments" do
    it "With all data" do
      expect(comment).to eq(true)
    end

    it "Without post id" do
      expect(comment1).to eq(false)
    end

    it "Without user id" do
      expect(comment2).to eq(false)
    end
  end

end
