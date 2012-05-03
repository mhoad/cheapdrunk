require 'spec_helper'

describe "Venue Pages" do

	subject { page }

	describe "new venues" do

    describe "add venue page" do
		  before { visit new_venue_path }
    	  it { should have_selector('h1',     text: 'Submit a new venue') }
    	  it { should have_selector('input',  id:   'venue_name') }
    	  it { should have_selector('input',  id:   'venue_email') }
        it { should have_selector('input',  id:   'venue_street_address') }
        it { should have_selector('input',  id:   'venue_suburb') }
        it { should have_selector('input',  id:   'venue_postcode') }
        it { should have_selector('input',  id:   'venue_phone_number') }
        it { should have_selector('input',  id:   'venue_url') }
        it { should have_selector('input',  id:   'venue_description') }
    	  it { should have_selector('input',  type: 'submit') }
      end

    describe "submitting a venue" do 
      before { visit new_venue_path }
      let(:submit) { "Submit Venue" }

      describe "with invalid information" do
        it "should not create a venue" do
          expect { click_button submit }.not_to change(Venue, :count)
        end
      end

      describe "with valid information" do
        before do
        fill_in "Name",              with: "Example Venue"
        fill_in "Email",             with: "user@example.com"
        fill_in "Street address",    with: "123 Example St"
        fill_in "Suburb",            with: "Sydney"
        fill_in "Postcode",          with: "2000"
        fill_in "Phone number",      with: "9528 2000"
        fill_in "Url",               with: "http://www.example.com/"
        fill_in "Description",       with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        end

        it "should create a venue" do
          expect { click_button submit }.to change(Venue, :count).by(1)
        end

        describe "after saving the user" do
          before { click_button submit }
          #let(:venue) { Venue.find_by_email('user@example.com') }

          it { should have_selector('flash_success', text: 'Thanks') }
        end 
      end


    end
  end

end