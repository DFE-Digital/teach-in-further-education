require 'spec_helper'

describe 'How to get into teaching components', :type => :feature do
    before do
        visit '/how-to-get-into-fe-teaching.html'
    end

    it "should have correct elements" do
        getAJobWithAFeProviderElement = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
        within getAJobWithAFeProviderElement do
          expect(getAJobWithAFeProviderElement).to have_selector 'h2.govuk-heading-l', text: "Get a job with a further education provider"
          expect(getAJobWithAFeProviderElement).to have_selector 'h3.govuk-heading-m', text: "For example"
          expect(getAJobWithAFeProviderElement).to have_selector 'p.govuk-body', count: 4
          expect(getAJobWithAFeProviderElement).to have_selector 'ul.govuk-list--bullet', count: 1
          expect(getAJobWithAFeProviderElement).to have_selector 'ol.govuk-list--number', count: 1
          expect(getAJobWithAFeProviderElement).to have_selector 'li', count: 7
          expect(getAJobWithAFeProviderElement).to have_selector '.app-image-2', count: 1
          expect(getAJobWithAFeProviderElement).to have_selector 'a.govuk-link', text: "How to apply for an FE teaching job"
        end

        prosAndConsElement = page.find_by_id("1KOfyONjdF71g4vBQYtd5w")
        within prosAndConsElement do
          expect(prosAndConsElement).to have_selector 'h2.govuk-heading-l', text: "This may be the best approach if:"
          expect(prosAndConsElement).to have_selector 'h2.govuk-heading-l', text: "This might not be the right approach if:"
          expect(prosAndConsElement).to have_selector 'p.govuk-body', count: 3
          expect(prosAndConsElement).to have_selector 'ul.govuk-list--bullet', count: 3
          expect(prosAndConsElement).to have_selector 'li', count: 8
          expect(prosAndConsElement).to have_selector 'a.govuk-link', text: "apprenticeship"
          expect(prosAndConsElement).to have_selector 'a.govuk-link', text: "What levels mean"
          expect(prosAndConsElement).to have_selector 'a.govuk-link', text: "FE teaching apprenticeship"
        end

        trainInYourOwnTimeElement = page.find_by_id("3sgkNrd6QSRt3xLBMMV5HE")
        within trainInYourOwnTimeElement do
          expect(trainInYourOwnTimeElement).to have_selector 'h2.govuk-heading-l', text: "Train in your own time"
          expect(trainInYourOwnTimeElement).to have_selector 'p.govuk-body', count: 1
          expect(trainInYourOwnTimeElement).to have_selector 'a.govuk-link', text: "train in your own time"
        end

        bottomContactBannerElement = page.find_by_id("57ltZ1kjZ3UMvmAJzCb8Kz")
        within bottomContactBannerElement do
          expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Got a question about getting a job with a local college or training provider?"
          expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Email: Teach.FE@education.gov.uk and our advisors will reply to you within 5 working days."
          expect(bottomContactBannerElement).to have_selector '.govuk-link', count: 1            
        end
    end

    it "should have the correct classes" do 
      getAJobWithAFeProviderBlock = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
      expect(getAJobWithAFeProviderBlock[:class]).to eq "app-advice "

      prosAndConsBlock = page.find_by_id("1KOfyONjdF71g4vBQYtd5w")
      expect(prosAndConsBlock[:class]).to eq ("app-advice ")

      trainInYourOwnTimeBlock = page.find_by_id("3sgkNrd6QSRt3xLBMMV5HE")
      expect(trainInYourOwnTimeBlock[:class]).to eq "app-advice "

      bottomContactBannerBlock = page.find_by_id("57ltZ1kjZ3UMvmAJzCb8Kz")
      expect(bottomContactBannerBlock[:class]).to eq "app-advice "

      newsletterCtaButtonBlock = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      expect(newsletterCtaButtonBlock[:class]).to eq "govuk-button "
    end

    it "Links should re-direct to the expected URLs" do
        link = page.find_link("How to apply for an FE teaching job", match: :first)
        within link do 
          expect(link[:href]).to end_with '/find-an-fe-teaching-job.html'
        end
        link = page.find_link("apprenticeship", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.gov.uk/become-apprentice'
        end
        link = page.find_link("What levels mean", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
        end
        link = page.find_link("FE teaching apprenticeship", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.instituteforapprenticeships.org/apprenticeship-standards/learning-and-skills-teacher-v1-1'
        end
        link = page.find_link("train in your own time", match: :first)
        within link do 
          expect(link[:href]).to end_with '/train-in-your-own-time.html'
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