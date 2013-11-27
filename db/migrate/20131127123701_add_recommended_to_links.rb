class AddRecommendedToLinks < ActiveRecord::Migration
  def change
  	#add a column to the links table
  	#call it is_recommended and default value is false
  	add_column :links, :is_recommended, :boolean, default: false
  end
end
