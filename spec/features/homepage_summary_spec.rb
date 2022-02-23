require 'spec_helper'

describe 'Homepage summary', :type => :feature do
  before do
    visit '/'
  end

  it "has the correct section heading" do
    rewardsOfTeachingElement = page.find_by_id("8Od3hFGQIxvanljvVEXor")
    within rewardsOfTeachingElement do 
      expect(rewardsOfTeachingElement).to have_selector 'h2.govuk-heading-l', text: "FE teaching is rewarding"
    end
  end
  it "'Easy way in' has correct elements" do
    easyWayInElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
    within easyWayInElement do 
      expect(easyWayInElement).to have_selector 'h3.govuk-heading-s', text: "Easy way in"
      expect(easyWayInElement).to have_selector '.govuk-body', count: 1
      expect(easyWayInElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/033223eb90b1381defaf9a286946c8ac/train_on_the_job_circle.png?w=150'
    end
  end
  it "'paid time off' has correct elements" do
    paidTimeOffElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
    within paidTimeOffElement do 
      expect(paidTimeOffElement).to have_selector 'h3.govuk-heading-s', text: "Paid time off"
      expect(paidTimeOffElement).to have_selector '.govuk-body', count: 1
      expect(paidTimeOffElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/3peXZu7e1XH6fxoyYGK32T/93ba1f8fb5282c6f0199e52347cd616c/paid_time_off_circle.png?w=150'
    end
  end
  it "'Change or add to your career' has correct elements" do  
    changeOrAddToCareerElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
    within changeOrAddToCareerElement do 
      expect(changeOrAddToCareerElement).to have_selector 'h3.govuk-heading-s', text: "Change or add to your career"
      expect(changeOrAddToCareerElement).to have_selector '.govuk-body', count: 1
      expect(changeOrAddToCareerElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/1tyxPQ6M3MlRqTKZVZAk59/6640268fec5eb70ec73b7c0163669bc4/flexible_working_hours_circle.png?w=150'
    end
  end
end