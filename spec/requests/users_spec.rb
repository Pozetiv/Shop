require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "SIGN up page" do

     before {visit new_user_registration_path}

    describe "invalide date" do
      it "should dont create new user" do
        expect{click_button "Sign up"}.not_to change(User, :count)
        expect(page).to have_title("Registration page")
      end
    end

    describe "SIGN up" do
      it "create" do
        fill_in "Username", with: "Test"
        fill_in "Email", with: "test@rspec.com"
        fill_in "Password", with: "testpassword"
        fill_in "Password confirmation", with: "testpassword"
        expect do
          click_button "Sign up"
        end.to change(User, :count).by(1)
      end
    end

  end


  describe "User page" do
    subject { page}

    describe "Profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before {visit user_path(user)}
      it {should have_content(user.username)}
      it {should have_content(user.email)}
    end

  describe "SIGN IN" do
    before {visit  new_user_session_path}
    subject {page}

    describe "invalide dates" do
    before {click_button "Log in"}
    it{should have_selector('div.alert.alert')}
    end

      describe "valide dates user" do
        let (:user) {FactoryGirl.create(:user)}
        before do
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Log in"
        end
        ## ADMIN PANEL
          it {should have_link('Creat new item', href: new_product_path)}
          it {should have_link('List users', href: users_path)}
          it {should have_link('List orders', href: orders_path)}
          it {should have_link('Todays orders', href:  today_orders_path )}
                                                              #####
          it {should have_link('Profile', href: user_path(user))}
          it {should have_link('Edit profile', href: edit_user_registration_path(user))}
          it {should have_link('Log out',    href: destroy_user_session_path) }
          it {should have_link('Cart', href: cart_path(user))}
          it {should_not have_link('Sign IN', href:  new_user_session_path) }


        describe "edit" do
          let(:user) { FactoryGirl.create(:user) }
          before {visit edit_user_registration_path(user)}
          subject {page}
          it {should have_content("Username")}
          it {should have_content("Email")}
          it {should have_content("Password")}
          it {should have_content("Current password")}
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




