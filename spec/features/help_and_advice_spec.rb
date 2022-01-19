require 'spec_helper'

describe 'Help and advice components', :type => :feature do
    before do
      visit '/help-and-advice.html'
    end

    it "should have correct elements and content" do
      howWeCanHelpElement = page.find_by_id("4CvK0Ica4yZWT5FYtTZdWZ")
      within howWeCanHelpElement do 
        expect(howWeCanHelpElement).to have_selector 'h2.govuk-heading-l', text: "How we can help"
        expect(howWeCanHelpElement).to have_selector '.govuk-body', count: 1
        expect(howWeCanHelpElement).to have_selector '.govuk-list--bullet', count: 1
        expect(howWeCanHelpElement).to have_selector 'li', count: 4
      end
      contactUsElement = page.find_by_id("44g2WLYJyWiyj65vmglyZy")
      within contactUsElement do 
        expect(contactUsElement).to have_selector '.govuk-heading-l', text: "Send us your questions"
        expect(contactUsElement).to have_selector '.govuk-body', count: 2
        expect(contactUsElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/3E26qZv6tkg9xfz6YKELoY/551868e774800f6399b71a944466c664/Helpandadvice.png?w=475' 
      end
    end

    it "should have correct classes" do
      howWeCanHelpElement = page.find_by_id("4CvK0Ica4yZWT5FYtTZdWZ")
      within howWeCanHelpElement do
        expect(howWeCanHelpElement[:class]).to eq "app-advice "
      end
      contactUsElement = page.find_by_id("44g2WLYJyWiyj65vmglyZy")
      within contactUsElement do
        expect(contactUsElement[:class]).to eq "app-advice "
      end
      newsletterCtaButtonElement = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      expect(newsletterCtaButtonElement[:class]).to eq "govuk-button "
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("Teach.FE@education.gov.uk")
      within link do 
        expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
      end
      newsletterCtaButton = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      within newsletterCtaButton do
        expect(newsletterCtaButton[:onClick]).to end_with "sign-up-for-our-newsletter.html'"
      end
    end
  end