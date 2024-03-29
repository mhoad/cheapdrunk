require 'spec_helper'

describe "Venue Pages" do

  subject { page }

	describe "new venues" do

    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit" }
    let(:user) { FactoryGirl.create(:admin_user) } #Since only admins have this ability

    before { sign_in user }

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
          let(:venue) { Venue.find_by_email('user@example.com') }

          it { should have_content('Thanks') }
        end 
      end
    end
  end

  describe "edit venue" do
    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit" }
    let(:user) { FactoryGirl.create(:admin_user) } #Since only admins have this ability
    
    describe "correct edit account options shown to admin users" do
      before do
        sign_in user 
        visit edit_venue_path(venue) 
      end
      it { should have_selector('input',  id:   'venue_name') }
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

    describe "update a venue with correct information" do
      before do
        sign_in user 
        visit edit_venue_path(venue) 
        fill_in "Name",       with: "Updated Venue"
        fill_in "Url",        with: "http://www.newvenueurl.com.au/"
        click_button submit
      end
      it { should have_content('Venue updated') } 
      it { should have_selector('h1', text: 'Updated Venue') }
      it { should have_content('http://www.newvenueurl.com.au/') } 
    end
  end

  describe "ensure regular users cannot edit a venue" do
    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit" }
    let(:user) { FactoryGirl.create(:user) } #Regular user

    before do
        sign_in user 
        visit edit_venue_path(venue) 
    end

    it { should_not have_selector('input',  id:   'venue_name') }
    it { should_not have_selector('input',  id:   'venue_name') }
    it { should have_content("Not authorized as an administrator") }
  end

  describe "view venue" do
    let(:venue) { FactoryGirl.create(:venue) }
    
    describe "should have the right content and markup" do
      before do
        visit venue_path(venue) 
      end
      it { should have_content(venue.name) }
      it { should have_content(venue.street_address) }
      it { should have_content(venue.postcode) }
      it { should have_content(venue.suburb) }
      it { should have_content(venue.phone_number) }
      it { should have_content(venue.url) }
    end
  end
end