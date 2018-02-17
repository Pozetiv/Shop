require 'rails_helper'

RSpec.describe "Products", type: :request do
    describe "CHECK- Create new products" do
      let (:userad) {User.create(username: "admin", email: "adminrs@admin.com", password: "admin1234", admin: true)}
      let(:cat) {Category.create(name:"First")}
      before do
        visit new_user_session_path
        fill_in "Email", with: userad.email
        fill_in "Password", with: userad.password
        click_button "Log in"
     end
      subject {page}
      it{should have_link('Creat new item', href: new_product_path)}
      before {click_link "Creat new item" }
      it "dont create new item" do
        visit new_product_path
        fill_in "Title", with: "Soup"
        fill_in "Description", with: "Soup with"
        fill_in "Price", with: "2"
 ##Need select category for product
      expect do
        click_button "Create new product"
      end.not_to change(Product, :count)
        expect(page).to have_selector('div.alert')
        end
    end

      describe "Buy" do
        let(:cat) {Category.create(name:"First")}
        let(:product) {Product.create(title: "soup", description: "soup with", price: "10", categoru_id: "1")}
        it "buy" do
          visit root_path
          #click_button "Add to cart"
        end
      end
end
