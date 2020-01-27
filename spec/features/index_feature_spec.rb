require 'rails_helper'


RSpec.describe "Search", type: :feature do
  describe "facts#index action" do
    it "should successfully show keyword field" do
      visit root_path
     expect(page).to have_field('keyword')
    end
  end


describe "facts#index action" do
    it "should successfully display results" do
      visit root_path
     page.fill_in 'keyword', with: 'Cat'
     click_button('Search')
     expect(page).to have_selector("#joke") # checks for id 'joke'
    end
  end

  describe "facts#index action" do
    it "should successfully display error" do
      visit root_path
     page.fill_in 'keyword', with: 'Alabama'
     click_button('Search')
     expect(page).to have_selector(".error_msgs") # checks for class 'error_msgs'
    end
  end

   


end
