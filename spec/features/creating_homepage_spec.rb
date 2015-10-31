require 'rails_helper'

RSpec.feature "Creating Home Page" do
    
    scenario "A user visit the home page of workout" do
        
        visit "/"
        expect(page).to have_content("Workout Lounge")
        
        click_link "Athletes Den"
        click_link "Home"
        
    end
end