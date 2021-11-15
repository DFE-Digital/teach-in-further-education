require 'spec_helper'

describe 'Header', :type => :feature do
  before do
    visit '/'
  end

  it 'Has a logo' do
    within 'header' do
      expect(page).to have_selector 'svg', count: 1
    end
  end
  
  it 'Has correct content' do
    within 'header' do
      expect(page).to have_selector '.govuk-header__logo', count: 1
      expect(page).to have_selector '.govuk-header__content', count: 1
    end
  end

  it 'has the correct heading' do
      siteHeading = page.find_link("Teach in further education", match: :first)
      within siteHeading do
          expect(siteHeading[:href]).to include '/'
      end
  end
end