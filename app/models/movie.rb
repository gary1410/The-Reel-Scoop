class Movie < ActiveRecord::Base
	has_many :reviews

	validates :title, presence: true


	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    self.all
	  end
	end
end
