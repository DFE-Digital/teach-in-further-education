require 'spec_helper'

describe 'Hero', :type => :feature do
  before do
    visit '/'
  end

  it "should have icon image" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      expect(advice.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/7GvBzU90bU19dAH8ASgT0N/2139c32a2dd8d003356c8d7bfd5c10cf/Homepage_hero.png?w=475'
    end
  end

  it "should have content" do
    advice = page.find_by_id("1osEp5cIptvcTW3oBml6g2")
    within advice do
      expect(advice).to have_selector 'p.govuk-body', text: "Change lives not your career. Teach around your current occupation."
    end
  end
end