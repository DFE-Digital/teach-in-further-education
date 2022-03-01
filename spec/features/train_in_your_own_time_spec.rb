require 'spec_helper'

describe 'Train In Your Own Time components', :type => :feature do
    before do
        visit '/train-in-your-own-time.html'
    end

    it 'Should have the correct elements' do
        trainInYourOwnTimeElement = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
        within trainInYourOwnTimeElement do
            expect(trainInYourOwnTimeElement).to have_selector '.govuk-body', count: 4
            expect(trainInYourOwnTimeElement).to have_selector '.app-image-2', count: 1
            expect(trainInYourOwnTimeElement).to have_selector '.govuk-link', count: 1
        end
        approachesElement = page.find_by_id("3rbmhWgWOe2mU4SWn0Nd3t")
        within approachesElement do
            expect(approachesElement).to have_selector 'h2.govuk-heading-l', text: "This may be the best approach if:" 
            expect(approachesElement).to have_selector 'h2.govuk-heading-l', text: "This might not be the right approach if:"
            expect(approachesElement).to have_selector '.govuk-list--bullet', count: 2
            expect(approachesElement).to have_selector 'li', count: 6
            expect(approachesElement).to have_selector '.govuk-body', count: 1
            expect(approachesElement).to have_selector '.govuk-link', count: 1
        end
        helpWithLivingExpensesElement = page.find_by_id("5hTTiOCjK33slAKAiPFby")
        within helpWithLivingExpensesElement do
            expect(helpWithLivingExpensesElement).to have_selector 'h2.govuk-heading-l', text: "Help with living expenses"
            expect(helpWithLivingExpensesElement).to have_selector '.govuk-body', count: 5
        end
        bottomContactBannerElement = page.find_by_id("1azWRZYSe5p6OxrVsOZsDj")
        within bottomContactBannerElement do
            expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Got a question about qualifications and funding?"
            expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Email: Teach.FE@education.gov.uk and our advisors will reply to you within 5 working days."
        end
    end

    it 'Should have the correct classes' do
        trainInYourOwnTimeBlock = page.find_by_id("12qLcJTqyRLLx3q5FjUBVA")
        expect(trainInYourOwnTimeBlock[:class]).to eq 'app-advice ' 

        approachesBlock = page.find_by_id("3rbmhWgWOe2mU4SWn0Nd3t")
        expect(approachesBlock[:class]).to eq 'app-advice '
        
        helpWithLivingExpensesBlock = page.find_by_id("5hTTiOCjK33slAKAiPFby")
        expect(helpWithLivingExpensesBlock[:class]).to eq 'app-advice '

        bottomContactBannerBlock = page.find_by_id("1azWRZYSe5p6OxrVsOZsDj")
        expect(bottomContactBannerBlock[:class]).to eq 'app-advice '

        newsletterCtaButtonElement = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
        expect(newsletterCtaButtonElement[:class]).to eq "govuk-button "
    end

    it "Links should redirect to expected URLs" do
        link = page.find_link("Here's a list of popular teacher training courses", match: :first)
        within link do
            expect(link[:href]).to end_with '/full-list-of-fe-qualifications.html'
        end
        link = page.find_link("Visit the student finance website", match: :first)
        within link do
            expect(link[:href]).to eq 'https://www.gov.uk/student-finance'
        end
        link = page.find_link("Information about bursaries available for 2022-2023.", match: :first)
        within link do
            expect(link[:href]).to eq 'https://www.gov.uk/government/publications/fe-funding-initial-teacher-education-ite-bursaries-2022-to-2023'
        end
        link = page.find_link("training on the job", match: :first)
        within link do
            expect(link[:href]).to end_with '/how-to-get-into-fe-teaching.html'
        end
        link = page.find_link("Teach.FE@education.gov.uk", match: :first)
        within link do
            expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
        end
        newsletterCtaButton = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
        within newsletterCtaButton do
          expect(newsletterCtaButton[:onClick]).to end_with "sign-up-for-our-newsletter.html'"
        end
    end
end