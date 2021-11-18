require 'spec_helper'

describe 'Homepage stories', :type => :feature do
  before do
    visit '/'
  end

  it "has the correct elements" do
    mechanicsStoryElement = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
    within mechanicsStoryElement do 
      expect(mechanicsStoryElement).to have_selector '.govuk-body', text: "Sometimes you get students who think they 'failed' at school. They do an FE course and it's the making of them. It gives people life chances."
      expect(mechanicsStoryElement).to have_selector '.govuk-body', text: "Raheem, FE motor mechanics teacher"
      expect(mechanicsStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/5VGbKPzFvKe1iR6d2OXUjF/c5460f1793b065c7af24c04559e1ca07/MechanicGuy.png?w=475'
    end
    agricultureStoryElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
    within agricultureStoryElement do 
      expect(agricultureStoryElement).to have_selector '.govuk-body', text: "You know when you're in another job and it’s the same every day? Here no day’s a chore. I’m surrounded by people who have enthusiasm for what I've been doing all my life."
      expect(agricultureStoryElement).to have_selector '.govuk-body', text: "Margaret, FE agriculture teacher"
      expect(agricultureStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/7ejtw2cz4ilNditvMdrh68/93c2e1cc97ac7d9c02bc5a4a0dce2a01/AgricultureLearning2.png?w=475'
    end
  end

  it "can render as a callout on left" do
    story = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
    expect(story).to have_selector 'div.call-out-border-left'
  end

  it "can render as a callout on right" do
    story = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
    expect(story).to have_selector 'div.call-out-border-right'
  end
end
