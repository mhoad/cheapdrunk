class VenuesController < ApplicationController

	layout "venue"

def index
	@venues = Venue.paginate(:page => params[:page])
end

def show
	@venue = Venue.find(params[:id])
end

def new
	
end

def create
	
end

def update
	
end

def destroy
	
end

end
