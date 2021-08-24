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
        has_css? 'govuk-link', count: 1
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
      flexibleHoursElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
      within flexibleHoursElement do 
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-body', count: 1
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/1tyxPQ6M3MlRqTKZVZAk59/a694496567f7ec882d6f3ab96579689e/flexible-working.png?w=150'
      end
      mechanicsImageElement = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
      within mechanicsImageElement do 
        has_css? 'govuk-body', count: 2
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/5VGbKPzFvKe1iR6d2OXUjF/c5460f1793b065c7af24c04559e1ca07/MechanicGuy.png?w=475'
      end
      agricultureImageElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
      within agricultureImageElement do 
        has_css? 'govuk-body', count: 2
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/7ejtw2cz4ilNditvMdrh68/93c2e1cc97ac7d9c02bc5a4a0dce2a01/AgricultureLearning2.png?w=475'
      end
  end

    it "should have correct classes" do
      youDoNotNeedADegreeElement = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
      within youDoNotNeedADegreeElement do
        expect(youDoNotNeedADegreeElement[:class]).to eq "app-advice shaded"
      end
      rewardsOfTeachingElement = page.find_by_id("6nmrZe3Zt8nCaqpHLZp6p0")
      within rewardsOfTeachingElement do
        expect(rewardsOfTeachingElement[:class]).to eq "app-columns-wrapper"
      end
      trainOnTheJobElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
      within trainOnTheJobElement do
        expect(trainOnTheJobElement[:class]).to eq "app-summary"
      end
      paidHolidayElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
      within paidHolidayElement do
        expect(paidHolidayElement[:class]).to eq "app-summary"
      end
      flexibleHoursElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
      within flexibleHoursElement do
        expect(flexibleHoursElement[:class]).to eq "app-summary"
      end
      mechanicsImageElement = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
      within mechanicsImageElement do
        expect(mechanicsImageElement[:class]).to eq "app-story"
      end
      agricultureImageElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
      within agricultureImageElement do
        expect(agricultureImageElement[:class]).to eq "app-story"
      end
    end
  end