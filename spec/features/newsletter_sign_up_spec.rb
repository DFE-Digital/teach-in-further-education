require 'spec_helper'

describe 'Newsletter sign up components', :type => :feature do
    before do
      visit '/sign-up-for-our-newsletter.html'
    end

    it "should have correct elements and content" do
      newsletterSignUpElement = page.find_by_id("5UxcEjlFGBCotCmsHce9wS")
      within newsletterSignUpElement do 
        expect(newsletterSignUpElement).to have_selector '.govuk-body', count: 4
        expect(newsletterSignUpElement).to have_selector 'ul.govuk-list--bullet', count: 1
        expect(newsletterSignUpElement).to have_selector 'li', count: 4
        expect(newsletterSignUpElement).to have_selector '.govuk-link', count: 1

      end
    end

    it "should have correct classes" do
      newsletterSignUp = page.find_by_id("5UxcEjlFGBCotCmsHce9wS")
      within newsletterSignUp do
        expect(newsletterSignUp[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
        link = page.find_link("TeachFE.newsletter@education.gov.uk")
        within link do 
          expect(link[:href]).to eq 'mailto:TeachFE.NEWSLETTER@education.gov.uk'
        end
    end
  end