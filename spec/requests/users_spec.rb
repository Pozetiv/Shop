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
    end

  describe "SIGN IN" do
    before {visit signin_path}
    subject {page}

    describe "invalide dates" do
    before {click_button "Log IN"}
    it{should have_selector('div.alert.alert-danger')}
    end

      describe "valide dates user" do
        let (:user) {FactoryGirl.create(:user)}
        before do
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Log IN"
        end
        ## ADMIN PANEL
          it {should_not have_link('Create new item', href: new_product_path)}
          it {should_not have_link('List users', href: new_product_path)}
          it {should_not have_link('List orders', href: orders_path)}
                                                              #####
          it {should have_link('Profile', href: user_path(user))}
          it {should have_link('Edit profile', href: edit_user_path(user))}
          it { should have_link('Log out',    href: logout_path) }
          it {should have_link('Cart', href: cart_path(user))}
          it { should_not have_link('Sign IN', href: signin_path) }


        describe "edit" do
          let(:user) { FactoryGirl.create(:user) }
          before {visit edit_user_path(user)}
          subject {page}
          it {should have_content("Name")}
          it {should have_content("Email")}
          it {should have_content("Password")}
          end

         describe "function log out" do
          before { click_link "Log out" }
          it { should have_link('Sign IN') }
           it {should have_title('Main page')}
         end

      end

  end

  end



end




