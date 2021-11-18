require 'spec_helper'

describe 'Homepage summary', :type => :feature do
  before do
    visit '/'
  end

  it "has the correct section heading" do
    rewardsOfTeachingElement = page.find_by_id("8Od3hFGQIxvanljvVEXor")
    within rewardsOfTeachingElement do 
      expect(rewardsOfTeachingElement).to have_selector 'h2.govuk-heading-l', text: "Rewards of teaching in further education"
    end
  end
  it "'train on the job' has correct elements" do
    trainOnTheJobElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
    within trainOnTheJobElement do 
      expect(trainOnTheJobElement).to have_selector 'h3.govuk-heading-s', text: "Train on the job"
      expect(trainOnTheJobElement).to have_selector '.govuk-body', count: 1
      expect(trainOnTheJobElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/baac35db26b85e8bd96f5da1deae03a2/paid-Icon.png?w=150'
    end
  end
  it "'paid holiday' has correct elements" do
    paidHolidayElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
    within paidHolidayElement do 
      expect(paidHolidayElement).to have_selector 'h3.govuk-heading-s', text: "Paid time off"
      expect(paidHolidayElement).to have_selector '.govuk-body', count: 1
      expect(paidHolidayElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/3peXZu7e1XH6fxoyYGK32T/532edee87108d14079d125ba89a27b25/paid-holiday.png?w=150'
    end
  end
  it "'flexible hours' has correct elements" do  
    flexibleHoursElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
    within flexibleHoursElement do 
      expect(flexibleHoursElement).to have_selector 'h3.govuk-heading-s', text: "Flexible working hours"
      expect(flexibleHoursElement).to have_selector '.govuk-body', count: 1
      expect(flexibleHoursElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/1tyxPQ6M3MlRqTKZVZAk59/a694496567f7ec882d6f3ab96579689e/flexible-working.png?w=150'
    end
  end
end