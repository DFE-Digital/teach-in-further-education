require 'spec_helper'

describe 'Advice', :type => :feature do
  before do
    visit '/'
  end

  it "can render an advice block with background" do
    advice = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
    expect(advice[:class]).to eq "app-advice shaded"
  end
end