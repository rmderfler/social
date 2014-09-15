describe "Messages" do

  it "adds a message" do
      user = User.create(:email => 'joe@j.com', :name => 'Joe', :password => 'password')
      visit '/users/sign_in'
      fill_in 'Email', :with => 'joe@j.com'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit users_path
      click_on 'Send message'
      fill_in 'message_content', :with =>'hi you'
      click_on 'Create Message'
      expect(page).to have_content 'hi you'
    end


   

end