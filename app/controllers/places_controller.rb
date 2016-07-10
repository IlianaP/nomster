class PlacesController < ApplicationController 
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 

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
		@place = current_user.places.create(place_params)
  		if @place.valid?
    		redirect_to root_path
  		else
    		render :new, status: :unprocessable_entity
  		end
	end

	def new
		@place = Place.new
	end 

	def show 
		@place = Place.find(params[:id]) 
	end 

	def edit 
		@place = Place.find(params[:id])
		if @place.user != current_user 
			return render text: "Not Allowed", status: :forbidden
	end end

	def update  
		@place = Place.find(params[:id]) 
		if @place.user != current_user 
			return render text: "Not Allowed", status: :forbidden
		end
		@place.update_attributes(place_params) 
		if @place.valid? 
			redirect_to root_path
		else 
			render :edit, status: :unprocessable_entity
		end
	end 

	def destroy 
		@place = Place.find(params[:id]) 
		if @place.user != current_user
			return render text: "Not Allowed", status: :forbidden 
		end 
		@place.destroy 
		redirect_to root_path
	end 


		
	private
	def place_params 
		params.require(:place).permit(:name, :description, :address) 
	end 

end 


