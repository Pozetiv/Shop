require 'rails_helper'

RSpec.describe "Api", type: :request do

  describe "Test show today orders" do


    describe "Must show page" do
    subject {page}
    before {visit new_user_session_path}
    let (:user) {FactoryGirl.create(:user)}
    before do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    describe "today_orders for admin" do
      before {visit today_orders_path}
      it {should have_title("Today orders")}
      it {should have_content("Today orders")}
      it {should have_content("Dates about client (name, email)")}
      it {should have_content("Items name -> price $ x quantity")}
      it {should have_content("Total price order")}
    end
    end

    describe "don't must show page" do
      subject {page}
      before {visit today_orders_path}
      it {should have_content('You need to sign in or sign up before continuing.')}

      describe "log in not admin" do
        before {visit new_user_session_path}
        let (:user1) {FactoryGirl.create(:tester)}
        before do
          fill_in "Email", with: user1.email
          fill_in "Password", with: user1.password
          click_button "Log in"
        end
        before {visit today_orders_path}
        it {should have_contnet('')}

      end



    end


  end
end