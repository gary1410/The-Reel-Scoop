require 'rails_helper'

describe MoviesController do
	before :each do
		@movie = FactoryGirl.create(:movie)
	end

  describe '#index' do
    it 'render the index template' do
    	get :index
    	expect(response).to render_template(:index)
    end

    it 'should assign all movies' do
    	get :index
    	expect(assigns[:movies]).to eq([@movie])
    end
  end

  describe '#show' do
  	it 'renders the show template' do
  		get :show, id: @movie.id
  		expect(response).to render_template(:show)
  	end

  	 it 'should assign movie based on id' do
    	get :show, id: @movie.id
    	expect(assigns[:movie]).to eq(@movie)
    end
	end

end
