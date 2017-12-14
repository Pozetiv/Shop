require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "SIGN up page" do

     before {visit signup_path}

    describe "invalide date" do
      it "should dont create new user" do
        expect{click_button "Create account"}.not_to change(User, :count)
        expect(page).to have_selector('div.alert')
      end
    end

    describe "SIGN up " do
      it "create" do
        fill_in "Name", with: "Test"
        fill_in "Email", with: "test@rspec.com"
        fill_in "Password", with: "testpassword"
        expect do
          click_button "Create account"
        end.to change(User, :count).by(1)
      end
    end

  end


  describe "User page" do
    subject { page}

    describe "Profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before {visit user_path(user)}
      it {should have_content(user.name)}
      it {should have_content(user.email)}
     # it { should have_link('Profile',     href: user_path(user)) }
      #it { should have_link('Log out',    href: logout_path) }
      #it { should have_link('Edite profile',    href: edit_user_path(user)) }
      #it { should_not have_link('Sign in', href: signin_path) }
    end

    #describe "followed by signout" do
     # before { click_link "Log out" }
      #it { should have_link('Sign IN') }
      #end
    
    describe "Edit profile"
    let(:user) {FactoryGirl.create(:user)}
    before (visit edit_user_path(user))




end
