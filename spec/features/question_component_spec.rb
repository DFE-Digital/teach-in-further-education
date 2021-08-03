require 'spec_helper'

describe 'Question component', :type => :feature do
    before do
      visit '/find-the-right-teaching-qualification-for-you.html'
    end

    it "should have correct elements" do
      questionForm = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within questionForm do 
        has_css? 'govuk-heading-l', count: 1
        has_css? 'govuk-form-group', count: 1
        has_css? 'govuk-label', count: 1
        has_css? 'govuk-radios__item', count: 4
      end
    end

    it "should have correct class" do
      questionForm = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within questionForm do
        expect(questionForm[:class]).to eq "app-question"
      end
    end

    it "should have a disabled submit button" do
      submitButton = page.find_by_id("question-submit-qNRtpmv245PlK1GAu8Mzm")
      within submitButton do 
        expect(submitButton[:class]).to eq "govuk-button"
      end
    end
  end
  