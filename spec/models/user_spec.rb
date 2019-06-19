require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(first_name: 'Sanel', last_name: 'Hodzic', email: 'sancho@test.com', password: 'istanbul', password_confirmation: 'istanbul').save  }
  let(:user1) { User.new(first_name: 'Sanel', last_name: 'Hodzic', email: '', password: 'istanbul', password_confirmation: 'istanbul').save }
  let(:user2) { User.new(first_name: '', last_name: '', email: 'sancho@test.com', password: 'istanbul', password_confirmation: 'istanbul').save }
  let(:user3) { User.new(first_name: 'Sanel', last_name: 'Hodzic', email: 'sancho@test.com', password: 'istanbul', password_confirmation: 'istanbul2').save }
  let(:user4) { User.new(first_name: 'Sanel', last_name: 'Hodzic', email: 'sancho@test.com', password: '', password_confirmation: '').save }

  it 'Evrything is ok' do
    expect(user).to eq(true)
  end

  it 'Email should exists' do
    expect(user1).to eq(false)
  end

  it 'First and Last name do not exists but it should not be problem' do
    expect(user2).to eq(true)
  end

  it 'Password and password confirmation must be same' do
    expect(user3).to eq(false)
  end

  it 'Password must not be empty' do
    expect(user4).to eq(false)
  end
end
