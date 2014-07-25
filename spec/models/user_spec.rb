require 'spec_helper'

describe User do
  it 'Email must be valid' do
    user = new_user(email: 'user1@example,com')
    expect(user.valid?).to eq false
  end

  it 'Password must be valid' do
    user = new_user(password: 'password')
    expect(user.valid?).to eq false
  end

  it 'Password must be between 6 and 9 characters and have one number' do
    user = new_user(password: 'pass1')
    expect(user.valid?).to eq false
  end

  it 'Requires a password confirmation' do
    user = new_user(
      password: '1password',
      password_confirmation: '',
    )
    expect(user.valid?).to eq false
  end

  it 'Requires a first and last name' do
    user = new_user(first_name: nil, last_name: nil)

    expect(user.valid?).to eq false
  end
end


