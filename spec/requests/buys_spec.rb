require 'rails_helper'

RSpec.describe "Buys", type: :request do

  describe "Test byu products" do
    before {visit new_user_session_path}
    subject {page}
    let (:user) {FactoryGirl.create(:user)}
    before do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end
    let (:category) {Category.create(name: "First")}
    let (:product) {Product.create(title: "Soup", description: "Soup with fish", price: "10", category_id: category )}
    before {visit root_path}
    it {should have_link('Cart', href: cart_path(user))}
    #it {should have_link(product.title)}
  end
end
