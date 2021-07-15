require 'spec_helper'

describe 'Story', :type => :feature do
  before do
    visit '/'
  end

  it "can render as a callout on left" do
    story = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
    expect(story).to have_css "div .call-out-border-left"
  end

  it "can render as a callout on right" do
    story = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
    expect(story).to have_css "div .call-out-border-right"
  end

  it "should have icon image" do
    story = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
    within story do
      have_selector 'img[src=//images.ctfassets.net/n4docnlbw89d/5VGbKPzFvKe1iR6d2OXUjF/f282ca7775d8b20e2aebc1e982cd9101/Construction.png]'
    end
  end
  
  it "should have content" do
    story = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
    within story do
      has_content? 'Margarets story'
    end
  end
end
