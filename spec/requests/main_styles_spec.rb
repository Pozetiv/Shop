require 'rails_helper'

RSpec.describe "MainStyles", type: :feature do

  describe "TEST layoutes " do

    subject { page }

    it "sign_in test" do
      visit root_path
      expect(page).to have_content('Sign IN')
      click_link "Sign IN"
      expect(page).to have_title("SIGN IN page")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end

    describe "sign up page" do

      it "ckeck to link on main page" do
        visit root_path
        expect(page).to have_content('Sign UP')
        click_link "Sign UP"
      end

      #redirect to SIGN_UP
      before {visit  new_user_registration_path }
      it {should have_title('Registration page')}
      it {should have_content('Username')}
      it {should have_content('Email')}
      it {should have_content('Password')}

    end

    describe "product form" do
      before {visit new_product_path}
      it {should have_content('Title')}
      it {should have_content('Description')}
      it {should have_content('Price')}
    end


  end
end