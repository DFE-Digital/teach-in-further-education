require 'spec_helper'

describe 'Navigation', :type => :feature do
  before do
    visit '/'
  end

  it 'Has the correct page links' do
      within 'header' do
      link = page.find_link("Home", match: :first)
        within link do
          expect(link[:href]).to end_with '/'
      end
    end
      within 'header' do
      link = page.find_link("Where to start in FE", match: :first)
        within link do
          expect(link[:href]).to end_with '/where-to-start-in-further-education.html'
      end
    end
    within 'header' do
      link = page.find_link("What you could teach", match: :first)
        within link do
          expect(link[:href]).to end_with '/what-you-could-teach.html'
      end
    end
      within 'header' do
      link = page.find_link("Train on the job", match: :first)
        within link do
          expect(link[:href]).to end_with '/train-on-the-job.html'
      end
    end
      within 'header' do
      link = page.find_link("Train in your own time", match: :first)
        within link do
          expect(link[:href]).to end_with '/train-in-your-own-time.html'
      end
    end
      within 'header' do
      link = page.find_link("Find an FE teaching job", match: :first)
        within link do
          expect(link[:href]).to end_with '/find-an-fe-teaching-job.html'
      end
    end
      within 'header' do
      link = page.find_link("Help and advice", match: :first)
        within link do
          expect(link[:href]).to end_with '/help-and-advice.html'
      end
    end
  end
end
