require 'rails_helper'

describe Review do

	it { should belong_to(:movie) }
	it { should validate_presence_of(:movie) }
	it { should validate_presence_of(:email) }

end