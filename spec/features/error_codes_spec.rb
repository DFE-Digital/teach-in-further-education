require 'spec_helper'

describe '404 page', :type => :feature do
  before do
    visit '/404.html'
  end

  it "should have correct elements" do
    wrapperElement = page.find_by_id("6ssWlm9lxuSmz7iOHitY7l")
    within wrapperElement do 
      expect(wrapperElement).to have_selector '.govuk-body', count: 3
      expect(wrapperElement).to have_content('If you typed the web address, check it is correct.')
    end
  end

  it "should have correct classes" do
    wrapperElement = page.find_by_id("6ssWlm9lxuSmz7iOHitY7l")
    within wrapperElement do
      expect(wrapperElement[:class]).to eq "app-advice "
    end
  end

  it "link should re-direct to expected url" do
    link = page.find_link("Go to our homepage.")
    within link do 
      expect(link[:href]).to eq 'https://www.teach-in-further-education.campaign.gov.uk/'
    end
  end

  describe '500 page', :type => :feature do
    before do
      visit '/500.html'
    end
  
    it "should have correct elements" do
      expect(page).to have_selector 'h1', text: 'Sorry, there is a problem with the service'

      wrapperElement = page.find_by_id("3jQUoCAU07tujL8wOuj2fB")
      within wrapperElement do 
        expect(wrapperElement).to have_selector '.govuk-body', text: 'Please try again later'
      end
    end
  
    it "should have correct classes" do
      wrapperElement = page.find_by_id("3jQUoCAU07tujL8wOuj2fB")
      within wrapperElement do
        expect(wrapperElement[:class]).to eq "app-advice "
      end
    end
  end
end