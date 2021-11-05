require 'spec_helper'

describe 'Train In Your Own Time components', :type => :feature do
    before do
        visit '/train-in-your-own-time.html'
    end

    it 'Should have the correct elements' do
        trainBeforeYouApplyElement = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
        within trainBeforeYouApplyElement do
            has_css? 'govuk-heading-l', count: 1
            has_css? 'govuk-body', count: 4
            has_css? 'app-image-2', count: 1
        end
        approachesElement = page.find_by_id("3rbmhWgWOe2mU4SWn0Nd3t")
        within approachesElement do
            has_css? 'govuk-heading-m', count: 2
            has_css? 'govuk-list govuk-list--bullet', count: 2
            has_css? 'li', count: 6
            has_css? 'govuk-body', count: 2
        end
        chooseQualificationElement = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
        within chooseQualificationElement do
            has_css? 'govuk-heading-l', count: 1
            has_css? 'govuk-body', count: 6
            has_css? 'govuk-list govuk-list--bullet', count: 1
            has_css? 'li', count: 4
        end
        findASuitableQualificationElement = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
        within findASuitableQualificationElement do
            has_css? 'govuk-heading-l', count: 1
            has_css? 'govuk-body', count: 1
            has_css? 'form', count: 1
            has_css? 'govuk-radios', count: 1
            has_css? 'govuk-radios__item', count: 4
            has_css? 'govuk-button', count: 1
        end
        fundingIsAvailableElement = page.find_by_id("5hTTiOCjK33slAKAiPFby")
        within fundingIsAvailableElement do
            has_css? 'govuk-heading-l', count: 1
            has_css? 'govuk-body', count: 6
            has_css? 'govuk-list govuk-list--bullet', count: 2
            has_css? 'li', count: 5
            has_css? 'govuk-heading-m', count: 1
        end
        bottomContactBannerElement = page.find_by_id("1azWRZYSe5p6OxrVsOZsDj")
        within bottomContactBannerElement do
            has_css? 'govuk-body', count: 2
        end
    end

    it 'Should have the correct classes' do
        trainBeforeYouApplyBlock = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
        within trainBeforeYouApplyBlock do
            expect(trainBeforeYouApplyBlock[:class]).to eq 'app-advice ' 
        end
        approachesBlock = page.find_by_id("3rbmhWgWOe2mU4SWn0Nd3t")
        within approachesBlock do
            expect(approachesBlock[:class]).to eq 'app-advice '
        end
        chooseQualificiationBlock = page.find_by_id("1xTlxAkJL5DzPuOCDYOsQG")
        within chooseQualificiationBlock do
            expect(chooseQualificiationBlock[:class]).to eq 'app-advice '
        end
        findSuitableQualificationBlock = page.find_by_id("qNRtpmv245PlK1GAu8Mzm")
        within findSuitableQualificationBlock do
            expect(findSuitableQualificationBlock[:class]).to eq 'app-question'
        end
        fundingIsAvailableBlock = page.find_by_id("5hTTiOCjK33slAKAiPFby")
        within fundingIsAvailableBlock do
            expect(fundingIsAvailableBlock[:class]).to eq 'app-advice '
        end
        bottomContactBannerBlock = page.find_by_id("1azWRZYSe5p6OxrVsOZsDj")
        within bottomContactBannerBlock do
            expect(bottomContactBannerBlock[:class]).to eq 'app-advice '
        end
    end

    it "Links should redirect to expected URLs" do
        link = page.find_link("Here's a list of popular teacher training courses.", match: :first)
        within link do
            expect(link[:href]).to include '/full-list-of-fe-qualifications.html'
        end
        link = page.find_link("You may be eligible to apply for a student loan to help pay for the course fees.", match: :first)
        within link do
            expect(link[:href]).to eq 'https://www.gov.uk/student-finance'
        end
        link = page.find_link("Train on the job", match: :first)
        within link do
            expect(link[:href]).to include '/train-on-the-job.html'
        end
        link = page.find_link("There are bursaries available for some subjects.", match: :first)
        within link do
            expect(link[:href]).to eq 'https://www.gov.uk/government/publications/initial-teacher-training-itt-bursary-funding-manual/initial-teacher-training-bursaries-funding-manual-2020-to-2021-academic-year'
        end
        link = page.find_link("PCET in Post-Compulsory Education and Training", match: :first)
        within link do
            expect(link[:href]).to include '/pgce-in-post-compulsory-education-and-training-pcet.html'
        end
        link = page.find_link("Diploma in Education and Training", match: :first)
        within link do
            expect(link[:href]).to include '/diploma-in-education-and-training.html'
        end
        link = page.find_link("Find out about the current teacher training bursaries available.", match: :first)
        within link do
            expect(link[:href]).to eq 'https://www.gov.uk/government/publications/fe-funding-initial-teacher-education-ite-2021-to-2022'
        end
        link = page.find_link("Teach.FE@education.gov.uk", match: :first)
        within link do
            expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
        end
    end
end