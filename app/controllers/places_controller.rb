class PlacesController < ApplicationController 
	def index 
		# @places = Place.all #SELECT * FROM places 
		@places = Place.paginate(:page => params[:page], :per_page => 5) 
		
	end 

	def show
		@place = Place.where(id: params[:id]).first #SELECT TOP 1 FROM places WHERE id = 1
		# @place = Place.find(params[:id])
		# @place = Place.find_by_id(params[:id])
	end 

	def create 
		@place = Place.create(place_params)
		redirect_to root_path
	end

	def new
		@place = Place.new
	end 

	def place_params 
		params.require(:place).permit(:name, :description, :address) 
	end 

end 


