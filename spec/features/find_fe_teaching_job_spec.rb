require 'spec_helper'

describe 'Find an fe teaching job components', :type => :feature do
    before do
      visit '/find-an-fe-teaching-job.html'
    end

    it "should have correct elements" do
      feProvidersElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      within feProvidersElement do 
        expect(feProvidersElement).to have_selector '.govuk-heading-l', count: 1
        expect(feProvidersElement).to have_selector '.govuk-list--bullet', count: 1
        expect(feProvidersElement).to have_selector '.govuk-body', count: 3
        expect(feProvidersElement).to have_selector 'li', count: 2
      end
      learnWhileYouLearnElement = page.find_by_id("1TvwovJDqZuFg4Eqwx4Bu2")
      within learnWhileYouLearnElement do 
        expect(learnWhileYouLearnElement).to have_selector '.govuk-heading-l', count: 1
        expect(learnWhileYouLearnElement).to have_selector '.govuk-body', count: 3
      end
      findAJobElement = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      within findAJobElement do 
        expect(findAJobElement).to have_selector '.govuk-heading-l', count: 1
        expect(findAJobElement).to have_selector '.govuk-list--bullet', count: 2
        expect(findAJobElement).to have_selector '.govuk-body', count: 6
        expect(findAJobElement).to have_selector 'li', count: 6
      end
    end
    
    it "should have the correct headings" do
      expect(page).to have_selector 'h2.govuk-heading-l', text: 'FE providers are independent organisations'
      expect(page).to have_selector 'h2.govuk-heading-l', text: 'Find a job'
      expect(page).to have_selector 'h3.govuk-heading-m', text: 'Where to start your search'
      expect(page).to have_selector 'h2.govuk-heading-l', text: 'Learn while you earn'
    end

    it "should have correct classes" do
      feProvidersElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      within feProvidersElement do
        expect(feProvidersElement[:class]).to eq "app-advice "
      end
      learnWhileYouLearnElement = page.find_by_id("1TvwovJDqZuFg4Eqwx4Bu2")
      within learnWhileYouLearnElement do
        expect(learnWhileYouLearnElement[:class]).to eq "app-advice "
      end
      findAJobElement = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      within findAJobElement do
        expect(findAJobElement[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
      within link do 
        expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
      end
      link = page.find_link("Association of colleges job site")
      within link do 
        expect(link[:href]).to eq 'https://www.aocjobs.com/'
      end
      link = page.find_link("TES - Times Educational Supplement job site")
      within link do 
        expect(link[:href]).to eq 'https://www.tes.com/jobs/browse/further-education-teaching-and-lecturing'
      end
      link = page.find_link("Further Education job site")
      within link do 
        expect(link[:href]).to eq 'https://www.fejobs.com/career-advice'
      end
      link = page.find_link("College Jobs")
      within link do 
        expect(link[:href]).to eq 'https://college.jobs.ac.uk/'
      end
    end
end