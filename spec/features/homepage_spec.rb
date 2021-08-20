require 'spec_helper'

describe 'Homepage components', :type => :feature do
    before do
      visit '/'
    end

    it "should have correct elements" do
      youDoNotNeedADegreeElement = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
      within youDoNotNeedADegreeElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 3
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'li', count: 2
      end
      rewardsOfTeachingElement = page.find_by_id("6nmrZe3Zt8nCaqpHLZp6p0")
      within rewardsOfTeachingElement do 
        has_css? 'govuk-heading-l', count: 1
      end
      trainOnTheJobElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
      within trainOnTheJobElement do 
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-body', count: 1
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/baac35db26b85e8bd96f5da1deae03a2/paid-Icon.png?w=150'
      end
      paidHolidayElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
      within paidHolidayElement do 
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-body', count: 1
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/3peXZu7e1XH6fxoyYGK32T/532edee87108d14079d125ba89a27b25/paid-holiday.png?w=150'
      end
      trainOnTheJobElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
      within trainOnTheJobElement do 
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-body', count: 1
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/baac35db26b85e8bd96f5da1deae03a2/paid-Icon.png?w=150'
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