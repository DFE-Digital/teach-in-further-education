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
    end

    it "should have correct classes" do
      skillsTradesElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      within skillsTradesElement do
        expect(skillsTradesElement[:class]).to eq "app-advice "
      end
      academicSubjectsElement = page.find_by_id("1TvwovJDqZuFg4Eqwx4Bu2")
      within academicSubjectsElement do
        expect(academicSubjectsElement[:class]).to eq "app-advice "
      end
      chooseYourQualificationElement = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
      within chooseYourQualificationElement do
        expect(chooseYourQualificationElement[:class]).to eq "app-advice "
      end
      listofCoursesElement = page.find_by_id("2C22TEQvPFHAAef6z96a1x")
      within listofCoursesElement do
        expect(listofCoursesElement[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
      within link do 
        expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
      end
      link = page.find_link("There are bursaries available for some subjects.")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/government/publications/initial-teacher-training-itt-bursary-funding-manual/initial-teacher-training-bursaries-funding-manual-2020-to-2021-academic-year'
      end
    end
end