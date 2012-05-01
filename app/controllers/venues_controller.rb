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
	@venue = Venue.find(params[:id])
  if @venue.update_attributes(params[:venue])
    flash[:success] = "Venue updated"
    redirect_to @venue
  else
    render 'edit'
  end
end

def edit
    @venue = Venue.find(params[:id])
end


def destroy
	
end



end
