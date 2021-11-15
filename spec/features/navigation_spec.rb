require 'spec_helper'

describe 'Navigation', :type => :feature do
  before do
    visit '/'
  end

  it 'Has the correct page links' do
      within 'header' do
      link = page.find_link("Home", match: :first)
        within link do
          expect(link[:href]).to include '/'
      end
    end
      within 'header' do
      link = page.find_link("A guide to FE teaching", match: :first)
        within link do
          expect(link[:href]).to include '/guide-to-further-education.html'
      end
    end
      within 'header' do
      link = page.find_link("Train on the job", match: :first)
        within link do
          expect(link[:href]).to include '/train-on-the-job.html'
      end
    end
      within 'header' do
      link = page.find_link("Train in your own time", match: :first)
        within link do
          expect(link[:href]).to include '/train-in-your-own-time.html'
      end
    end
      within 'header' do
      link = page.find_link("Find an FE teaching job", match: :first)
        within link do
          expect(link[:href]).to include '/find-an-fe-teaching-job.html'
      end
    end
      within 'header' do
      link = page.find_link("Help and advice", match: :first)
        within link do
          expect(link[:href]).to include '/help-and-advice.html'
      end
    end
  end
end
