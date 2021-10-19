require 'spec_helper'

describe 'Accordion components', :type => :feature do
  before do
    visit '/accordion.html'
  end

  it "should have correct number of steps" do
    steps = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
    within steps do
      has_css? 'div', count: 3
    end
  end

  it "should have the right classes" do
    defaultContentElement = page.find_by_id("accordion-default-content-0")
    within defaultContentElement do
      expect(defaultContentElement[:class]).to eq "govuk-accordion__section-content"
    end
  end
end