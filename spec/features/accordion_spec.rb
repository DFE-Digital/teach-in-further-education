require 'spec_helper'

describe 'Accordion components', :type => :feature do
  before do
    visit '/accordion.html'
  end

  it "should have correct elements" do
    steps = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
    within steps do
      has_css? 'div', count: 3
      has_css? 'govuk-accordion', count: 1
    end
  end

  it "should have correct classes" do
    defaultContentElement = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
    within defaultContentElement do
      expect(defaultContentElement[:class]).to eq "govuk-accordion"
    end
    accordionDefaultButton = page.find_by_id("accordion-default-heading-0")
    within accordionDefaultButton do
      expect(accordionDefaultButton[:class]).to eq "govuk-accordion__section-button" 
    end
    accordionDefaultButton1 = page.find_by_id("accordion-default-heading-1")
    within accordionDefaultButton1 do
      expect(accordionDefaultButton1[:class]).to eq "govuk-accordion__section-button"
    end
    accordionDefaultButton2 = page.find_by_id("accordion-default-heading-2")
    within accordionDefaultButton2 do
      expect(accordionDefaultButton2[:class]).to eq "govuk-accordion__section-button"
    end
  end
end