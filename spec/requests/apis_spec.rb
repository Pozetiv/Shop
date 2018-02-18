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
        let (:tester) {FactoryGirl.create(:tester)}
        before do
          fill_in "Email", with: tester.email
          fill_in "Password", with: tester.password
          click_button "Log in"
        end
        before {visit today_orders_path}
        #it {should have_selector('div.alert.danger')}
        #it {should have_content('Your cant do this, because your are not admin')}
      end

    end

    describe "json" do
      it "not authenticat admin" do
        get '/today_orders.json'
        expect(response).to have_http_status 401
      end
    end
  end
end