require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit "/"
     assert_selector "h1", text: "Awesome Product"
     assert_selector "h3", text: "LeWagon"
   end


   test "as a user, I can create a product " do
    login_as users(:george)
    visit "products/new"

    assert_selector "form"
    fill_in "product_name", with: "New Product"
    fill_in "product_tagline", with: "This is a catchy tagline"
    click_on "Create Product"
    save_and_open_screenshot

    assert_equal root_path, page.current_path
    assert_selector "h3", text: "New Product"
   end
end
