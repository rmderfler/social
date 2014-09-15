require 'rails_helper'
describe User do

  it 'works with factory girl' do
    user = build(:user)
    expect(user.email).to eq "email@email.com"
    expect(user.name).to eq "Joe"
  end

  it { should have_many(:friends).through(:friendships)}
  it { should validate_uniqueness_of :email}
end