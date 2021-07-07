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
<<<<<<< HEAD
       have_selector '[/ways-to-train.html]'
        has_content? 'Ways to train'
=======
        have_selector '/ways-to-train.html'
>>>>>>> 5d54d5ec6b5a2fd10ad68834c1f6ec42ee9d244c
      end
    end
  end

<<<<<<< HEAD

  it 'renders the drop down' do
    link = page.find_by_id('41US5qsuhy3YToT8Rjbznc')
    within link do
      has_selector? 'a#7q9J5UO8FFt1YLTovARt6k'
  end
end
=======
  it 'renders the drop down' do
    link = page.find_by_id('41US5qsuhy3YToT8Rjbznc')
    within link do
      have_selector 'a#30zC6ehmTs7QXh0ymjNUpI'
    end
  end
>>>>>>> 5d54d5ec6b5a2fd10ad68834c1f6ec42ee9d244c
end
