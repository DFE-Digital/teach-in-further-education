require 'spec_helper'

describe 'Find an fe teaching job components', :type => :feature do
    before do
      visit '/find-an-fe-teaching-job.html'
    end

    it "should have correct elements" do
      feProvidersElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      within feProvidersElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'govuk-body', count: 3
        has_css? 'li', count: 2
      end
      learnWhileYouLearnElement = page.find_by_id("1TvwovJDqZuFg4Eqwx4Bu2")
      within learnWhileYouLearnElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 2
      end
      carreerChangersElement = page.find_by_id("5sdBDktTAPtjx0YlzHUdGD")
      within carreerChangersElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 2
      end
      backgroundElement = page.find_by_id("5qnWPcfMwkXv2d8ZSYmkrM")
      within backgroundElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 2
      end
      findAJobElement = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      within findAJobElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'govuk-body', count: 6
        has_css? 'li', count: 2
      end
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
      carreerChangersElement = page.find_by_id("5sdBDktTAPtjx0YlzHUdGD")
      within carreerChangersElement do
        expect(carreerChangersElement[:class]).to eq "app-advice "
      end
      backgroundElement = page.find_by_id("5qnWPcfMwkXv2d8ZSYmkrM")
      within backgroundElement do
        expect(backgroundElement[:class]).to eq "app-advice "
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
      link = page.find_link("You might not be able to work as an FE teacher if you have commited certain offences or have unspent criminal convictions")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/tell-employer-or-college-about-criminal-record'
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