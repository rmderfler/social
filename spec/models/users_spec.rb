describe User do
  it { should have_many(:friends).through(:friendships)}
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :email}

end