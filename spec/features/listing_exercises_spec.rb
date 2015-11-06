require 'rails_helper'

RSpec.feature "Listing the exercise" do
    
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
        @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
        login_as(@john)
        
        @following = Friendship.create(user: @john, friend: @sarah)
        
        @e1 = @john.exercises.create(duration_in_min: 30, workout: "Body building routine", workout_date: Date.today)
        @e2 = @john.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: Date.today)
    end
    
    scenario "list user's past 7 day's workout" do
        
        visit "/"
        click_link "My Lounge"
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
        
    end
    
    scenario "show a list user's friends" do
        
        visit "/"
        click_link "My Lounge"
        expect(page).to have_content("My Friends")
        expect(page).to have_link(@sarah.full_name)
        expect(page).to have_link("Unfollow")
    end
end
