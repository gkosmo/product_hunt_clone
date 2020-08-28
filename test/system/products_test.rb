require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
   test "visiting the root" do
     visit "/"
     assert_selector "h1", text: "Products"
     assert_selector ".product", count: Product.count
   end

   test "user signed in can create a product" do
      login_as users(:george)
      visit "/products/new"
      save_and_open_screenshot
      assert_selector 'form', count: 1

      assert_selector '#product_name', count: 1
      assert_selector '#product_tagline', count: 1

      #assert_selector "button", text: "Create Product"

      fill_in "product_name", with: "Le Wagon"
      fill_in "product_tagline", with: "Change your life: Learn to code"
      # save_and_open_screenshot

      click_on 'Create Product'
      # save_and_open_screenshot

      # Should be redirected to Home with new product
      assert_equal root_path, page.current_path
      assert_text "Change your life: Learn to code"

   end
end
