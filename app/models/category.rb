class Category < ActiveRecord::Base

	#let teh category know about links
	has_many :links

  #lets add some validation to ensure data is what we want

  validates :name, presence: true, uniqueness: { message: "already gone", case_sensitive: false}
   #validates :name, presence: true, uniqueness: true
  validates :rank, presence: true, numericality: {greater_than: 0}



end
