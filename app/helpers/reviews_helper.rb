module ReviewsHelper
  def display_stars(star)
    (1..5).inject("") do |output, i|
      output << radio_button_tag('star3',nil, i.eql?(star), :class => 'star', :disabled => true)
    end.html_safe
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