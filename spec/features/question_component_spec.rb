require 'spec_helper'

describe 'Question component', :type => :feature do
    before do
      visit '/find-the-right-teaching-qualification-for-you.html'
    end

    it "should have correct radio buttons" do
      questionForm = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
      within questionForm do 
        has_css? 'div', count: 4
      end
    end

    it "should have text against label1" do
      visit '/find-the-right-teaching-qualification-for-you.html'
      label1 = page.find_by_id("3cChhb7mHTk4CApUy4Grbf")
      within label1 do
      expect(label1[:class]).to eq "govuk-label govuk-radios__label"
      end
    end

    it "should have text against label2" do
      visit '/find-the-right-teaching-qualification-for-you.html'
      label2 = page.find_by_id("k2NflABnJCxRk260SUr7l")
      within label2 do
      expect(label2[:class]).to eq "govuk-label govuk-radios__label"
      end
    end

    it "should have text against label3" do
      visit '/find-the-right-teaching-qualification-for-you.html'
      label3 = page.find_by_id("3nEGsh2BzZPp9zYGq6D7FA")
      within label3 do
      expect(label3[:class]).to eq "govuk-label govuk-radios__label"
      end
    end

    it "should have text against label4" do
      visit '/find-the-right-teaching-qualification-for-you.html'
      label4 = page.find_by_id("2kLaG1uO0pXkHSFosd6tdx")
      within label4 do
      expect(label4[:class]).to eq "govuk-label govuk-radios__label"
      end
    end

      it "should let user select a label and submit" do
        visit '/find-the-right-teaching-qualification-for-you.html'
        radioButton = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
        within radioButton do 
          submit

        submitButton = page.find_by_id("question-submit-qNRtpmv245PlK1GAu8Mzm")
        within submitButton do
          submitQuestionForm
        end
      end
    end
  end
  