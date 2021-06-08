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



end
