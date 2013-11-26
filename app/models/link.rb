class Link < ActiveRecord::Base

 # lets link up this model with a category
   belongs_to :category
   
	#add some validations
	validates :name, presence: true
	validates :url, presence: true, uniqueness: true
end
