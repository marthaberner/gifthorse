require 'spec_helper'

describe User do
  it 'Email must be valid' do
    user = User.new(
      email: 'user1@example,com',
      password: 'password1'
    )
    expect(user.valid?).to eq false
  end

  it 'Email cannot be blank' do
    user = User.new(
      email: '',
      password: 'password1'
    )
    expect(user.valid?).to eq false
  end

  it 'Password must be valid' do
    user = User.new(
      email: 'user1@example.com',
      password: 'password'
    )
    expect(user.valid?).to eq false
  end

  it 'Accepts password that starts with a number' do
    pending
    user = User.new(
      email: 'user1@example.com',
      password: '1password',
      password_confirmation: '1password'
    )
    expect(user.valid?).to eq true
  end

  it 'Password must be between 6 and 9 characters and have one number' do
    user = User.new(
      email: 'user1@example.com',
      password: '1pass',
      password_confirmation: '1pass'
    )
    expect(user.valid?).to eq false
  end

  it 'Creates user with password confirmation' do
    pending
    user = User.new(
      email: 'user1@example.com',
      password: '1password',
      password_confirmation: '1password',
    )
    expect(user.valid?).to eq true
  end

  it 'Requires a password confirmation' do
    pending
    user = User.new(
      email: 'user1@example.com',
      password: '1password',
      password_confirmation: '',
    )
    expect(user.valid?).to eq false
  end
end


