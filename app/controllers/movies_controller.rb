class MoviesController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		@movies = Movie.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
	end

	def show
		@movie = Movie.find(params[:id])
	end

	private

	def sort_column
		Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

end
