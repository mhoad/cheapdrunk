module ReviewsHelper
  def display_stars(star)
    output = ""
    for i in 1..5
      if i.eql? star
        output << radio_button_tag('star3',nil, true, :class => 'star', :disabled => true)
      else
        output << radio_button_tag('star3',nil, false, :class => 'star', :disabled => true)
      end
    end
    output.html_safe
  end

  def average_rating(venue_id)
    @venue = Venue.find(venue_id)
    @average = 0
    if !@venue.reviews.empty?
      @venue.reviews.each do |review|
      @average = @average + review.rating
      end
      @average / @venue.reviews.count.round(0).to_int
    end
  end
end