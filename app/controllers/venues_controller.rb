class VenuesController < ApplicationController

	layout "venue", :except => [:show]

  add_breadcrumb "Homepage", :root_path
  add_breadcrumb "Venues", :venues_path, :title => "Sydney Bars Pubs"

def index
	@venues = Venue.paginate(:page => params[:page]).per_page(2)
end

def show
	@venue = Venue.find(params[:id])
  render :layout => "show_venue"
  
end

def new
	@venue = Venue.new
  @venue.trading_times.new 
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
  authorize! :edit, @user, :message => 'Not authorized as an administrator.'
  @venue = Venue.find(params[:id])
end


def destroy
	Venue.find(params[:id]).destroy
    flash[:success] = "Venue deleted."
    redirect_to venues_path
end

end
