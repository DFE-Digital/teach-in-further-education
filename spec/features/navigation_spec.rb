require 'spec_helper'

describe 'Navigation', :type => :feature do
  before do
    visit '/'
  end

  it 'has the logo' do
    expect(page).to have_selector 'header'
    within 'header' do
      have_selector 'img'
    end
  end

  it 'can render a link' do
    link = page.find_by_id('15FI0WUAPnHGy98eB7XW5N')
    within link do
      within 'a' do
        has_content? 'Ways to train'
      end
    end
  end
end
