require 'spec_helper'

describe 'Steps', :type => :feature do
  it "should have correct number of steps" do
    visit '/steps.html'
    steps = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
    within steps do
      has_css? 'div', count: 3
    end
  end
end
