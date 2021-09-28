require 'spec_helper'

describe 'Help and advice components', :type => :feature do
    before do
      visit '/help-and-advice.html'
    end

    it "should have correct elements" do
      howWeCanHelpElement = page.find_by_id("4CvK0Ica4yZWT5FYtTZdWZ")
      within howWeCanHelpElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'li', count: 4
      end
      aboutOurAdvisorsElement = page.find_by_id("6UkTGPOiLhwqP34pJGveU3")
      within aboutOurAdvisorsElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 1
      end
      contactUsElement = page.find_by_id("44g2WLYJyWiyj65vmglyZy")
      within contactUsElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 2
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/3E26qZv6tkg9xfz6YKELoY/551868e774800f6399b71a944466c664/Helpandadvice.png?w=475'
      end
    end

    it "should have correct classes" do
      howWeCanHelpElement = page.find_by_id("4CvK0Ica4yZWT5FYtTZdWZ")
      within howWeCanHelpElement do
        expect(howWeCanHelpElement[:class]).to eq "app-advice "
      end
      aboutOurAdvisorsElement = page.find_by_id("6UkTGPOiLhwqP34pJGveU3")
      within aboutOurAdvisorsElement do
        expect(aboutOurAdvisorsElement[:class]).to eq "app-advice "
      end
      contactUsElement = page.find_by_id("44g2WLYJyWiyj65vmglyZy")
      within contactUsElement do
        expect(contactUsElement[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("Teach.FE@education.gov.uk")
      within link do 
        expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
      end
    end
  end