class LinksController < ApplicationController

	#before everything in here find the category
	before_action :get_category

	#before edit, update, destroy find the link
	before_action :get_link, only: [:edit, :update, :destroy]

  def new
  	  if params[:duplicate_id].present?
      #do duplicate this
      @duplicate_link = @category.links.find(params[:duplicate_id])
      @link = @category.links.new(@duplicate_link.attributes)
  	  else
  	  	# do a brand new one
        @link = @category.links.new
  	  end
  	
  end

  def create
  	@link = @category.links.new(link_params)
    
    if @link.save
    	flash[:success] = "link added"
    	redirect_to category_path(@category)
    else
    	render :new
    end

  end

  def edit
  	# I want to find link within category
  #	@link = @category.links.find(params[:id])
  end

  def update
  	#@link = @category.links.find(params[:id])

  	if @link.update(link_params)
  		flash[:success] = "Link edited"
  		redirect_to category_path(@category)
  	else
  		render :edit
  	end
  end

  def destroy
  	#@link = @category.links.find(params[:id])
  	@link.destroy
  	flash[:success] = "link was deleted"
  	redirect_to category_path(@category)
end
#to stop people hacking our site, only allow from form
  def link_params
   params.require(:link).permit(:name, :description, :url, :is_recommended)
  end

  def get_category
  	#because we are not in the categories controller
  	# we need to find ID of the category
  	# using the /categories/:category_id/links/new
  	@category = Category.find(params[:category_id])
  end


  def get_link
  	@link = @category.links.find(params[:id])
  end

end
