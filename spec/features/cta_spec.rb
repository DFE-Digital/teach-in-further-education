require 'spec_helper'

describe 'CTA', :type => :feature do
  it "should render a primary CTA" do
    visit '/cta.html'
    cta = page.find_by_id("5ReWFP1ydQPOwVN70poh1P")
    expect(cta[:class]).to eq "govuk-button "

    within cta do
      expect(cta).to have_content "Primary"
    end
  end

  it "should render a secondary CTA" do
    visit '/cta.html'
    cta = page.find_by_id("5ReWFP1ydQPOwVN70poh1Q")
    expect(cta[:class]).to eq "govuk-button govuk-button--secondary"

    within cta do
      expect(cta).to have_content "Secondary"
    end
  end

  it "should render a warning CTA" do
    visit '/cta.html'
    cta = page.find_by_id("5ReWFP1ydQPOwVN70poh1R")
    expect(cta[:class]).to eq "govuk-button govuk-button--warning"

    within cta do
      expect(cta).to have_content "Warning"
    end
  end
end
