require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { User.create first_name: 'Sanel', last_name: 'Hodzic', email: 'sancho@test.com', password: 'istanbul', password_confirmation: 'istanbul' }
  let(:user1) { User.create first_name: 'Sanel1', last_name: 'Hodzic1', email: 'sancho1@test.com', password: 'istanbul', password_confirmation: 'istanbul' }

  let(:post) { Post.new(content: "sdkjashg dshdkasg", user_id: user.id).save }
  let(:post1) { Post.new(content: "", user_id: user.id).save }
  let(:post2) { Post.new(content: "sdkjash", user_id: "").save }
  
  context "Testing posts" do

    it "With all data" do
      expect(post).to eq(true)
    end

    it "Without content" do
      expect(post1).to eq(false)
    end

    it "Without user_id" do
      expect(post2).to eq(false)
    end

  end
end
