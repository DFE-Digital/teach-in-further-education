require 'spec_helper'

describe 'Pages should be accessible', :type => :feature do
  before do
    visit '/'
  end

  it 'is axe clean' do
    expect(page).to be_axe_clean
  end
end
