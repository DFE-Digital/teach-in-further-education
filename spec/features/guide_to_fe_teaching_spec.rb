require 'spec_helper'

describe 'Guide to FE teaching components', :type => :feature do
    before do
      visit '/guide-to-further-education.html'
    end

    it "should have correct elements" do
      guideToFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within guideToFurtherEducationElement do 
        has_css? 'govuk-heading-l', count: 6
        has_css? 'govuk-body', count: 27
        has_css? 'govuk-list govuk-list--bullet', count: 7
        has_css? 'li', count: 42
        have_selector '//images.ctfassets.net/n4docnlbw89d/lI0hWqdJ9MJiZphs8126w/b712a01091e5ee4e58154f821cfcdcc9/Sarah-sStory.png?w=475'
      end
    end

    it "should have correct classes" do
      guideToFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within guideToFurtherEducationElement do
        expect(guideToFurtherEducationElement[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("If you have significant career experience, you may be able to start teaching with an FE provider.")
      within link do 
        have_selector 'href = "/financial-support-to-train.html"'       
      end
      
    end
  end