require 'spec_helper'

describe "Reviews" do

  subject { page }

  describe "user permissions" do
    let(:venue) { FactoryGirl.create(:venue) }

    before do
        visit venue_path(venue) 
    end

    describe "not logged in" do
      it { should have_content('Please login to leave a comment') } 
      it { should have_link('Login') }
    end

    describe "logged in user" do
      let(:user) { FactoryGirl.create(:user) } #Regular user
      
      before do
        sign_in user 
        visit venue_path(venue)  
      end

      it { should have_selector('input',    id:   'review_rating_1') }
      it { should have_selector('input',    id:   'review_rating_2') }
      it { should have_selector('input',    id:   'review_rating_3') }
      it { should have_selector('input',    id:   'review_rating_4') }
      it { should have_selector('input',    id:   'review_rating_5') }
      it { should have_selector('textarea', id:   'review_comment') }
      it { should have_selector('input',    type: 'submit') }

      it { should_not have_content('Please login to leave a comment') } 
      it { should_not have_link('Delete Review') } 
    end

    describe "admin user" do
      let(:user) { FactoryGirl.create(:admin_user) } #Admin user
      
      before do
        sign_in user 
        visit venue_path(venue)  
      end

      it { should have_selector('input',    id:   'review_rating_1') }
      it { should have_selector('input',    id:   'review_rating_2') }
      it { should have_selector('input',    id:   'review_rating_3') }
      it { should have_selector('input',    id:   'review_rating_4') }
      it { should have_selector('input',    id:   'review_rating_5') }
      it { should have_selector('textarea', id:   'review_comment') }
      it { should have_selector('input',    type: 'submit') }

      it { should_not have_content('Please login to leave a comment') } 
    end
  end

  describe "submitting and viewing reviews" do
    let(:user) { FactoryGirl.create(:user) } #Regular user
    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit Review" }
      
    before do
      sign_in user 
      visit venue_path(venue)
      fill_in 'review_comment', with: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit 
                                       consectetur adipisicing elit, sed do eiusmod,'
      choose('review_rating_4')
    end

    it "should increase the review count" do
      expect { click_button submit }.to change(Review, :count).by(1)
    end

    describe "it should show the review on the page" do
      before { click_button submit }

      it { should have_content('Reviewed by: ') }
      it { should have_content('Lorem ipsum dolor sit amet') }
      it { should_not have_link('Delete Review') }
      it { should have_content('Based on 1 vote') }
      it { should have_content('Thanks for adding your review') }
      
    end
  end

  describe "admins can delete reviews" do
    let(:user) { FactoryGirl.create(:admin_user) } #Admin user
    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit Review" }

    before do
      sign_in user 
      visit venue_path(venue)
      fill_in 'review_comment', with: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit 
                                       consectetur adipisicing elit, sed do eiusmod,'
      choose('review_rating_4')
      click_button submit
    end

    it { should have_link('Delete Review') }
  end

  describe "cannot submit empty review" do
    let(:user) { FactoryGirl.create(:admin_user) } #Admin user
    let(:venue) { FactoryGirl.create(:venue) }
    let(:submit) { "Submit Review" }

    before do
      sign_in user 
      visit venue_path(venue)
      click_button submit
    end

    it { should have_content('Please ensure your review is between 100 - 500 characters') }

  end
end