require 'spec_helper'

describe 'Hero', :type => :feature do
  before do
    visit '/'
  end

  it "should have icon image" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      expect(advice.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/7GvBzU90bU19dAH8ASgT0N/884c7ad5661fd6b00272e91198af704e/EngineeringStudentsLearning.png?w=475'
    end
  end

  it "should have content" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      expect(advice).to have_selector 'p.govuk-body', text: "Teach your trade, skill or subject to young people and adults"
    end
  end
end