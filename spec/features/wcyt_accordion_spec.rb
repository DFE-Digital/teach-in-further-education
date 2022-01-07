require 'spec_helper'

describe 'Accordion components -', :type => :feature do
  before do
    visit '/wyct-accordion.html'

    #expand all accordions
    find('button.govuk-accordion__open-all').click()

  end

  it "should have correct elements" do
    #assert the page level for an accordion
    expect(page).to have_selector '.govuk-accordion', count: 1

    #find the accordion content block and assert within that
    accordionBlock = page.find_by_id("7xDb0h6J2h6c11GhWHR0J")
    within accordionBlock do
      expect(accordionBlock).to have_selector '.govuk-accordion__open-all', count: 1
      expect(accordionBlock).to have_selector '.govuk-accordion__section', count: 2
      expect(accordionBlock).to have_selector '.govuk-accordion__icon', count: 2

      #assert the accordion headings
      expect(accordionBlock).to have_selector '.govuk-accordion__section-heading', text: "Skills, trades and vocational subjects"
      expect(accordionBlock).to have_selector '.govuk-accordion__section-heading', text: "Academic subjects"
    end

    #find 1st accordion and assert content
    accordion1 = page.find_by_id("2dSAy6Mk1OlBMIiVDcPJ0u")
    within accordion1 do
      expect(accordion1).to have_selector 'h2.govuk-heading-l', count: 1
      expect(accordion1).to have_selector 'h3.govuk-heading-m', count: 3
      expect(accordion1).to have_selector 'h4.govuk-heading-s', count: 1
      expect(accordion1).to have_selector '.govuk-body', count: 9
      expect(accordion1).to have_selector '.govuk-list--bullet', count: 1
      expect(accordion1).to have_selector 'li', count: 15
      expect(accordion1).to have_selector '.govuk-link', count: 1
    end

    #find 2nd accordion and assert content
    accordion2 = page.find_by_id("e0XCvhr4XVEtz0N0hZMCf")
    within accordion2 do
      expect(accordion2).to have_selector 'h2.govuk-heading-l', count: 1
      expect(accordion2).to have_selector 'h3.govuk-heading-m', count: 1
      expect(accordion2).to have_selector '.govuk-body', count: 3
      expect(accordion2).to have_selector '.govuk-list--bullet', count: 1
      expect(accordion2).to have_selector 'li', count: 8
    end
  end

  it "first accordion should render the correct links" do
    link = page.find_link("What levels mean", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
    end
  end
end