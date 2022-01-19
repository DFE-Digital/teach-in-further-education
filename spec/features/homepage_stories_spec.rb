require 'spec_helper'

describe 'Homepage stories', :type => :feature do
  before do
    visit '/'
  end

  it "has the correct elements" do
    homepageStory1Element = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
    within homepageStory1Element do 
      expect(homepageStory1Element).to have_selector '.govuk-body', text: "I decided to try teaching part time in an FE college whilst I ran my business. It was so simple to get started – I was able to start earning and teaching straight away using the skills I had from industry."
      expect(homepageStory1Element.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/5VGbKPzFvKe1iR6d2OXUjF/32a4d31c312b78c21b16fc770bf22c41/Homepage_quote_1.png?w=475'
    end
    homepageStory2Element = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
    within homepageStory2Element do 
      expect(homepageStory2Element).to have_selector '.govuk-body', text: "You know when you're in another job and it’s the same every day? Here no day’s a chore. I’m surrounded by people who have enthusiasm for what I've been doing all my life."
      expect(homepageStory2Element.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/7ejtw2cz4ilNditvMdrh68/b8515351734babfb7665ce6f97d09af9/Homepage_quote_2.png?w=475'
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
