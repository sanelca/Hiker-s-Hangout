require 'rails_helper'

RSpec.describe User, type: :model do
  context "Testing registration" do
    it "With all data" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbul" ).save
      expect(user).to eq(true)
    end
    it "Wrong password confirmation" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "sancho@test.com", password: "istanbul", password_confirmation: "istanbulss" ).save
      expect(user).to eq(false)
    end
    it "Without email" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "", password: "istanbul", password_confirmation: "istanbul" ).save
      expect(user).to eq(false)
    end
    it "Without email expect true" do
      user = User.new(first_name: "Sanel", last_name: "Hodz", email: "", password: "istanbul", password_confirmation: "istanbul" ).save
      expect(user).to eq(false)
    end
  end
end
