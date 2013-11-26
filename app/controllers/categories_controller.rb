class CategoriesController < ApplicationController

  # i want to run get_category before show, edit, update and destroy
  # not to repeat same code over and over
  # we can use before_action to do things before any method

  before_action :get_category, only: [:show, :edit, :update, :destroy]

 #step 2 is to add index page
 #we want to define teh index of our controller

   def index
 	#this is where all of our code for index page

 	@username = "ME"
 	@age = 10

#static array
 #	@categories = ["Design", "Rails", "Javascript"]

#now lets talk to the model
@categories = Category.all.order("rank asc, name asc")
   end

  #individual page for category
  def show
    # now in get_category method
  	# @category = Category.find(params[:id])

  end

  # the new form for a category
  def new
  	@category =Category.new
  end

  # actually add the category using the data in the form

  def create
      @category =Category.new(category_params)

      if  @category.save
        flash[:success] = "Category Created"

        #go back to home page
       redirect_to root_path

      else
        #if category does not save we want to output some errors
        # we have already got a new.html.erb
        # we want a new form
        render "new"

      end
      
      
  end

  #get a form to edit this category

    def edit
      # this is now in get_category
      #@category = Category.find(params[:id])
    end
#actually update the row in db

  def update

    if
     # get_category
     #updates based on secure below
      @category.update(category_params)
  
        flash[:success] = "Category Updated"
        redirect_to root_path
    else

      #show the edit form again if it does not update
      #edit.html.erb in our views

      render :edit

    end
  

end

# actually delete the category in the db

 def destroy
#get_category
# destroy the row
@category.destroy

#tell the user you have deleted this category
flash[:success] = "Category deleted"

redirect_to root_path
 end


#to not repeat ourselfs lets create a new method to simplify

def get_category
      @category = Category.find(params[:id])
end



   # whitelist all of the form data

   def category_params
   	  params.require(:category).permit(:name, :rank)
    end

end
