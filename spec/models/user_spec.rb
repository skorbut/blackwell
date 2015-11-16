require 'rails_helper'

describe User do
  it 'contains the expected fields' do
    user = User.new
    expect(user).to respond_to :email
    expect(user).to respond_to :encrypted_password
    expect(user).to respond_to :confirmation_token
    expect(user).to respond_to :remember_token
    expect(user).to respond_to :created_at
    expect(user).to respond_to :updated_at
  end
end
