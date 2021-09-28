require 'spec_helper'

describe 'Summary', :type => :feature do
  before do
    visit '/'
  end

  it "should have icon image" do
    advice = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
    within advice do
      have_selector 'img[src=//images.ctfassets.net/n4docnlbw89d/4WR8LyTybbtdzXNOxGTMkR/baac35db26b85e8bd96f5da1deae03a2/paid-Icon.png]'
    end
  end

  it "should have title" do
    advice = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
    within advice do
      has_content? '37 days paid holiday'
    end
  end

  it "should have content" do
    advice = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
    within advice do
      has_content? 'Term-based holidays mean FE teachers typically get 37 days
      paid leave per year, plus all the bank holidays.'
    end
  end
end