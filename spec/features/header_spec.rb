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

  it 'has the correct heading link' do
      link = page.find_link("Teach in further education", match: :first)
      within link do
          expect(link[:href]).to end_with '/'
      end
  end
end