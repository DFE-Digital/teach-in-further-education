require 'spec_helper'

describe ' components', :type => :feature do
    before do
      visit '/financial-support-to-train.html'
    end

    it "should have correct elements" do
      trainingOnTheJobElement = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
      within trainingOnTheJobElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 7
      end
      trainBeforeYouApplyElement = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
      within trainBeforeYouApplyElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 3
      end
      chooseYourQualificationElement = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
      within chooseYourQualificationElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'govuk-body', count: 6
        has_css? 'li', count: 4
      end
    end

    it "should have correct classes" do
      trainingOnTheJobElement = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
      within trainingOnTheJobElement do
        expect(trainingOnTheJobElement[:class]).to eq "app-advice "
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/lza5filA0VlqXNUB0X7HJ/6132507391a068275e4412dc6c05fd98/EarnWhileYouLearn.png?w=475'
      end
      trainBeforeYouApplyElement = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
      within trainBeforeYouApplyElement do
        expect(trainBeforeYouApplyElement[:class]).to eq "app-advice "
        have_selector 'http://images.ctfassets.net/n4docnlbw89d/xrbpAnsDT493GYrkv5yL5/8cd895925fecfbc818fe6cb5ae6edf87/TrainingBeforeWork.png?w=475'
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
      link = page.find_link("What levels mean", match: :first)
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
      end
      link = page.find_link("There are bursaries available for some subjects.")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/government/publications/initial-teacher-training-itt-bursary-funding-manual/initial-teacher-training-bursaries-funding-manual-2020-to-2021-academic-year'
      end
    end
end