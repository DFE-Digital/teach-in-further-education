require 'spec_helper'

describe 'Help and advice components', :type => :feature do
    before do
      visit '/help-and-advice.html'
    end

    it "should have correct elements" do
      howWeCanHelpElement = page.find_by_id("4CvK0Ica4yZWT5FYtTZdWZ")
      within howWeCanHelpElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 1
        has_css? 'li', count: 4
      end
      trainBeforeYouApplyElement = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
      within trainBeforeYouApplyElement do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-body', count: 3
      end
      availableFundingElement = page.find_by_id("5hTTiOCjK33slAKAiPFby")
      within availableFundingElement do 
        has_css? 'govuk-heading-m', count: 1
        has_css? 'govuk-heading-s', count: 1
        has_css? 'govuk-list govuk-list--bullet', count: 2
        has_css? 'govuk-body', count: 6
        has_css? 'li', count: 6
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
      availableFundingElement = page.find_by_id("5hTTiOCjK33slAKAiPFby")
      within availableFundingElement do
        expect(availableFundingElement[:class]).to eq "app-advice "
      end
    end

    it "links should re-direct to expected urls" do
      link = page.find_link("You may be eligible to apply for a student loan to help pay for the course fees", match: :first)
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/student-finance'
      end
      link = page.find_link("Find a job in FE on the Association of Colleges website")
      within link do 
        expect(link[:href]).to eq 'https://www.aocjobs.com/'
      end
      link = page.find_link("Find out about the teacher training bursaries available")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/government/publications/fe-funding-initial-teacher-education-ite-academic-year-2020-to-2021'
      end
    end
  end