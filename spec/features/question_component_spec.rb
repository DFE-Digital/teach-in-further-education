require 'spec_helper'

describe 'Find a suitable qualification', :type => :feature do
    it "should have correct radio buttons" do
      visit '/experience-and-qualifications.html'

      radio button = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within radio button do 
        has_css? 'div', count: 4

      label1 = page.find_by_id("3cChhb7mHTk4CApUy4Grbf")
      within label1 do
      expect(label1[:class]).to eq "govuk-radios__item"

      label2 = page.find_by_id("k2NflABnJCxRk260SUr7l")
      within label2 do
      expect(label2[:class]).to eq "govuk-radios__item"

      label3 = page.find_by_id("3nEGsh2BzZPp9zYGq6D7FA")
      within label3 do
      expect(label3[:class]).to eq "govuk-radios__item"

      label4 = page.find_by_id("2kLaG1uO0pXkHSFosd6tdx")
      within label4 do
      expect(label4[:class]).to eq "govuk-radios__item"

      end
    end
  end