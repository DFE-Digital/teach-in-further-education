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
      expect(trainOnTheJobElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/03fe79bfb48e4c11f15a684d3e207c9e/Icon_1.png?w=150'
    end
  end
  it "'paid holiday' has correct elements" do
    paidHolidayElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
    within paidHolidayElement do 
      expect(paidHolidayElement).to have_selector 'h3.govuk-heading-s', text: "Paid time off"
      expect(paidHolidayElement).to have_selector '.govuk-body', count: 1
      expect(paidHolidayElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/3peXZu7e1XH6fxoyYGK32T/426cb39a0e51f7b1204b7a6e8ade2ff7/Icon_2.png?w=150'
    end
  end
  it "'flexible hours' has correct elements" do  
    flexibleHoursElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
    within flexibleHoursElement do 
      expect(flexibleHoursElement).to have_selector 'h3.govuk-heading-s', text: "Flexible working hours"
      expect(flexibleHoursElement).to have_selector '.govuk-body', count: 1
      expect(flexibleHoursElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/1tyxPQ6M3MlRqTKZVZAk59/db0f13cf8aebf381a7b55ca70f52da64/Icon_3.png?w=150'
    end
  end
end