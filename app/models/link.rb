class Link < ActiveRecord::Base

 # lets link up this model with a category
   belongs_to :category
   
	#add some validations
	validates :name, presence: true
	validates :url, presence: true, uniqueness: true

# this is something we have made up
    def nice_url
    	#lets remove http and www
       url.gsub("http://", "").gsub("wwww","")
    end
end
