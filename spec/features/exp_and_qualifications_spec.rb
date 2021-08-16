require 'spec_helper'

describe 'Experience and Qualifications components', :type => :feature do
    before do
      visit '/subject-specific-qualifications.html'
    end

    it "should have correct elements" do
      skillsTradesElement = page.find_by_id("2dSAy6Mk1OlBMIiVDcPJ0u")
      within skillsTradesElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-heading-m', count: 1
        has_css? 'govuk-body', count: 7
      end
      academicSubjectsElement = page.find_by_id("e0XCvhr4XVEtz0N0hZMCf")
      within academicSubjectsElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-body', count: 2
      end
      chooseYourQualificationElement = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
      within chooseYourQualificationElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'govuk-body', count: 6
        has_css? 'li', count: 4
      end
    end

    it "should have correct class" do
      skillsTradesElement = page.find_by_id("2dSAy6Mk1OlBMIiVDcPJ0u")
      within skillsTradesElement do
        expect(skillsTradesElement[:class]).to eq "app-advice"
      end
      academicSubjectsElement = page.find_by_id("e0XCvhr4XVEtz0N0hZMCf")
      within academicSubjectsElement do
        expect(academicSubjectsElement[:class]).to eq "app-advice"
      end
      chooseYourQualificationElement = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
      within chooseYourQualificationElement do
        expect(chooseYourQualificationElement[:class]).to eq "app-advice"
      end
      listofCoursesElement = page.find_by_id("2C22TEQvPFHAAef6z96a1x")
      within listofCoursesElement do
        expect(listofCoursesElement[:class]).to eq "app-advice"
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_by_id("2dSAy6Mk1OlBMIiVDcPJ0u")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
      end
      link = page.find_by_id("e0XCvhr4XVEtz0N0hZMCf")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
      end
      link = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/government/publications/initial-teacher-training-itt-bursary-funding-manual/initial-teacher-training-bursaries-funding-manual-2020-to-2021-academic-year'
      end
      link = page.find_by_id("2C22TEQvPFHAAef6z96a1x")
      within link do 
        expect(link[:href]).to eq 'http://localhost:4567/full-list-of-fe-qualifications.html'
    end
  end