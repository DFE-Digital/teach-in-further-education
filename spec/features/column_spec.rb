require 'spec_helper'

describe 'Story', :type => :feature do
  before do
    visit '/'
  end

  it "should have correct number of blocks" do
    story = page.find_by_id("6nmrZe3Zt8nCaqpHLZp6p0")
    within story do
      has_css? '.app_columns div', count: 3
    end
  end
end

