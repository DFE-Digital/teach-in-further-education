require 'spec_helper'

describe '404 page', :type => :feature do
  before do
    visit '/404.html'
  end

  it "should have correct elements" do
    wrapperElement = page.find_by_id("6ssWlm9lxuSmz7iOHitY7l")
    within wrapperElement do 
      has_css? 'govuk-body', count: 3
    end
  end

  it "should have correct classes" do
    wrapperElement = page.find_by_id("6ssWlm9lxuSmz7iOHitY7l")
    within wrapperElement do
      expect(skillsTradesElement[:class]).to eq "app-advice "
    end
  end

  it "link should re-direct to expected url" do
    link = page.find_link("Go to our homepage.")
    within link do 
      expect(link[:href]).to eq 'https://www.teach-in-further-education.campaign.gov.uk/'
    end
end