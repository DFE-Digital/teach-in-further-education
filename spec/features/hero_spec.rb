require 'spec_helper'

describe 'Hero', :type => :feature do
  before do
    visit '/'
  end

  it "should have icon image" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      have_selector 'img[src=//images.ctfassets.net/n4docnlbw89d/7GvBzU90bU19dAH8ASgT0N/d860da67789d6fa50c1cb2bcee880b08/Default-Hero-Img.png]'
    end
  end

  it "should have content" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      has_content? "Pass on your skills and experience to train the UK's future experts"
    end
  end
end