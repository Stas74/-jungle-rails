require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature,  js: true do 

   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Can navigate from the home page to the product detail page by clicking on a product" do
    

    # ACT
    visit root_path
    first("article.product").click_link("Details")
    # puts page.html

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # DEBUG
    # save_screenshot
    # puts page.html

    # VERIFY
    expect(page).to have_text 'Description', count: 1
    expect(page).to have_content 'Quantity'
  end



end
