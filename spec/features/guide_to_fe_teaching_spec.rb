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
      link = page.find_link("Here's a list of popular teacher training courses.")
      within link do
        have_selector 'href="/full-list-of-fe-qualifications.html"'
      end
      link = page.find_link("Find out more about the 2 ways of doing teacher training.")
      within link do
        have_selector 'href = "/financial-support-to-train.html"'
      end
      link = page.find_link("According to the National Careers Service the average salary for an FE teacher ranges from £24,000 to £37,000.")
      within link do
        have_selector 'href = "https://nationalcareers.service.gov.uk/job-profiles/further-education-lecturer"'
      end
      link = page.find_link("Find your local FE college on the Association of Colleges website")
      within link do
        have_selector 'href= "https://www.aocjobs.com/employers-a-z"'
      end
      link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website")
      within link do
        have_selector 'href= "https://www.aelp.org.uk/about/our-members/"'
      end
      link = page.find_link("Find your local FE college on the Association of Colleges website")
      within link do
        have_selector 'href= "https://www.aocjobs.com/employers-a-z"'
      end
      link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website")
      within link do
        have_selector 'href= "https://www.aelp.org.uk/about/our-members/"'
    end
  end
end