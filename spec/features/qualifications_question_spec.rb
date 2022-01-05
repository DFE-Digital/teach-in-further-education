require 'spec_helper'

describe 'Qualification questions component', :type => :feature do
    before do
      visit '/qualification-question-page.html'
    end

    it "should have correct elements" do
      questionForm = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within questionForm do 
        expect(questionForm).to have_selector 'h2.govuk-heading-l', text: "Find your training course options"
        expect(questionForm).to have_selector '.govuk-form-group', count: 1
        expect(questionForm).to have_selector '.govuk-label', text: "What is your highest educational qualification?"
        expect(questionForm).to have_selector '.govuk-label', text: "None"
        expect(questionForm).to have_selector '.govuk-label', text: "GCSE, O Level, Scottish Ordinary, BTEC Level 1-2"
        expect(questionForm).to have_selector '.govuk-label', text: "A Level, Scottish Higher, BTEC Level 3"
        expect(questionForm).to have_selector '.govuk-label', text: "Degree or above"
        expect(questionForm).to have_selector '.govuk-radios__item', count: 4
        expect(questionForm).to have_selector 'input.govuk-button', count: 1
      end
    end

    it "should have correct class" do
      questionForm = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within questionForm do
        expect(questionForm[:class]).to eq "app-question"
      end
    end

    it "should have a submit button" do
      submitButton = page.find_by_id("question-submit-qNRtpmv245PlK1GAu8Mzm")
      within submitButton do 
        expect(submitButton[:type]).to eq 'submit'
      end
    end
  end