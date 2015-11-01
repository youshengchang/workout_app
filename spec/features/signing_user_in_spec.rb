require 'rails_helper'

RSpec.feature "Signing User In" do
    
    before do
        
        @john = User.create(email: "john@example.com", password: "password")
        
    end
    
    scenario "valide user signed in" do
        visit "/"
        
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
        
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{@john.email}")
        
        
    end
    
    scenario "invalide user signed in" do
        
        visit "/"
        click_link "Sign in"
        fill_in "Email", with: ""
        fill_in "Password", with: ""
        click_button "Log in"
        
        expect(page).to have_content("Invalid email or password.")
        
    end
end