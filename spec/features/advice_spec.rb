require 'spec_helper'

describe 'Advice', :type => :feature do
  before do
    visit '/'
  end

  it "can render an with background" do
    advice = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
    expect(advice[:class]).to eq "app-advice shaded"
  end

  # it "can render as a callout on left" do
  #   advice = page.find_by_id("5dr70Vcxk5sQLytyEibhDN")
  #   expect(advice).to have_css "div .call-out-border-left"
  # end
  #
  # it "can render as a callout on right" do
  #   advice = page.find_by_id("3i4erSWLCL6KDJMuy72dEF")
  #   expect(advice).to have_css "div .call-out-border-right"
  # end
end