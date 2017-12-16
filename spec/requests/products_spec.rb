require 'rails_helper'

RSpec.describe "Products", type: :request do
    describe "Create new products" do
      let (:userad) {User.create(name: "admin", email: "adminrs@admin.com", password: "admin1234", admin: true)}
      before do
        visit signin_path
        fill_in "Email", with: userad.email
        fill_in "Password", with: userad.password
        click_button "Log IN"
     end
      subject {page}
      it{should_not have_link('Creat new item', href: new_product_path)}

    end
end
