describe "Users" do

  it "adds friend when user clicks 'become friend'" do
      user = User.create(:email => 'joe@j.com', :name => 'Joe', :password => 'password')
      user2 = User.create(:email => 'jill@j.com', :name => 'Jill', :password => 'password')
      visit '/users/sign_in'
      fill_in 'Email', :with => 'jill@j.com'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit users_path
      first('.friend').click_on 'Become Friend'
      expect(page).to have_content "Added friend"
    end


   

end