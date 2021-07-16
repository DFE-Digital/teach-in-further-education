require 'spec_helper'

describe 'Advice', :type => :feature do
  before do
    visit '/'
  end

  it "has correct class" do
    advice = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
    expect(advice[:class]).to eq "app-advice"
  end
end