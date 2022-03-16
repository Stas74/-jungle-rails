require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
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

  scenario "visit the home page and click 'Add to Cart' buttons for one of the products" do
        
    # ACT[
    visit root_path
    first("article.product").click_on("Add")
    # puts page.html

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # DEBUG
    # save_screenshot
    # puts page.html

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
    save_screenshot    

  end

end
