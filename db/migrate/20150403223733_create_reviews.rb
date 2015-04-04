class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.string :email
    	t.integer :rating
    	t.string :comment
    	t.belongs_to :movie

    	t.timestamps
    end
  end
end
