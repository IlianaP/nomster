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
		binding.pry
		@place = Place.create(name: params[:name], address: params[:address], description: params[:description])
		render :show
	end

	def new
		@place = Place.new
	end 

end 


