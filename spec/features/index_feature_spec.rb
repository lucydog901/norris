require 'rails_helper'


RSpec.describe "Search", type: :feature do
  describe "facts#index action" do
    it "should successfully show keyword field" do
      visit root_path
     expect(page).to have_field('keyword')
    end
  end

describe "facts#index action" do
    it "should successfully display fact" do
      visit root_path
     expect(page).to have_content("keyword")
    end
  end


   


end
