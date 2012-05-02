class VenuesController < ApplicationController

	layout "venue"

def index
	@venues = Venue.paginate(:page => params[:page])
end

def show
	@venue = Venue.find(params[:id])
end

def new
	@venue = Venue.new
end

def create
	@venue = Venue.new(params[:venue])
    if @venue.save
      flash[:success] = "Thanks for contributing. Once your venue is approved we will add it to the site"
      redirect_to root_path
    else
      render 'new'
    end
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
	Venue.find(params[:id]).destroy
    flash[:success] = "Venue deleted."
    redirect_to venues_path
end

end
