require 'spec_helper'

describe "User Authentication" do
  describe "when visiting the sign in page" do

    it "should successfully register a user" do

    	visit "/users/new"
    	expect(current_path).to eq(new_user_path)

    	#expect a link in the nav to Sign Up
    	within(:css, '.navbar') do
    		find_link("Sign Up").visible?
    	end

    	user = FactoryGirl.build(:user)

    	fill_in "user[email]", :with => user.email
    	fill_in "user[first_name]", :with => user.first_name
    	fill_in "user[last_name]", :with => user.last_name
    	fill_in "user[password]", :with => user.password
      fill_in "user[password_confirmation]", :with => user.password
    	click_button "Create Account"

    	expect(current_path).to eq(root_path)
    	expect(page).to have_content("Account created")

    	within(:css, '.navbar') do
    		has_no_link? ('Sign Up')
    		has_link?('Logout')
    	end
    end

    it "should fail registration" do
    	visit "/users/new"
    	user = FactoryGirl.build(:user)

    	#Invalid form submission
    	fill_in "user[email]", :with => user.email
    	click_button "Create Account"
    	#Should redirect to users_path and
    	expect(current_path).to eq(users_path)
    	#no message saying 'Account created' should appear
        expect(page).to have_no_content("Account Created")
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

      within(:css, ".alert") do
        have_content("try again")
      end
    end

    it "should successfully log in" do
        visit '/'
        page.has_no_link?('Logout').should be_true
        user = setup_signed_in_user
        page.has_link?("Logout").should be_true
    end

    it "should unseccessfully log in" do
      visit '/user_sessions/new'
      fill_in "email", with: "a@b.com"
      fill_in "password", with: "invalid creds"
      click_button "Login"
      expect(current_path).to eq(user_sessions_path)
      expect(page).to have_content("Login failed")
    end

    it "should successfully Logout" do
      user = setup_signed_in_user
      visit '/'
      click_link 'Logout'
      expect(page).to have_content("Bye")
      # has_no_link('Logout')
    end
  end
end



