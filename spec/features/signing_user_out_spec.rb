require 'rails_helper'

RSpec.feature "Signing user out" do
    
    before do
        
        @john = User.create(email: "john@example.com", password: "password")
        
        visit "/"
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
        
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{@john.email}")
    end
    
    scenario "sign user out" do
        
        visit "/"
        click_link "Sign out"
        
        expect(page).to have_content("Signed out successfully")
        
    end
end
