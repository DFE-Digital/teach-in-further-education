require 'spec_helper'

describe 'Find a suitable qualification', :type => :feature do
    it "should have correct radio buttons" do
      visit '/experience-and-qualifications.html'
      none = page.find_by_id("3cChhb7mHTk4CApUy4Grbf")
      within none do
      expect(none[:text]).to eq "None"
      end

      
    end
  end