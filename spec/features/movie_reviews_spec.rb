require 'rails_helper'

feature 'movie reviews' do
	before :each do
		@movie = FactoryGirl.create(:movie)
		@review = FactoryGirl.create(:review, movie: @movie)
	end
  scenario 'are displayed for a specific movie' do
  	visit root_path
  	click_link(@movie.title)
  	expect(page).to have_content(@review.email)
  end

end
