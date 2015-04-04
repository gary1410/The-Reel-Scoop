class Review < ActiveRecord::Base
	belongs_to :movie

	validates :movie, presence: true
	validates :email, presence: true

end
