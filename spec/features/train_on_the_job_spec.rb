require 'spec_helper'

describe 'Train On The Job components', :type => :feature do
    before do
        visit '/train-on-the-job.html'
    end

    it "should have correct elements" do
        trainingOnTheJobElement = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
        within trainingOnTheJobElement do
            expect(trainingOnTheJobElement).to have_selector 'h2.govuk-heading-l', text: "Training on the job"
            expect(trainingOnTheJobElement).to have_selector '.govuk-body', count: 5
        end
        approachesAndGetStartedElement = page.find_by_id("1KOfyONjdF71g4vBQYtd5w")
        within approachesAndGetStartedElement do
            expect(approachesAndGetStartedElement).to have_selector 'h3.govuk-heading-m', text: "This may be the best approach if:"
            expect(approachesAndGetStartedElement).to have_selector '.govuk-list--bullet', count: 2
            expect(approachesAndGetStartedElement).to have_selector 'li', count: 7
            expect(approachesAndGetStartedElement).to have_selector 'h3.govuk-heading-m', text: "This might not be the right approach if:"
            expect(approachesAndGetStartedElement).to have_selector 'h3.govuk-heading-m', text: "How to get started"
        end
        findAnFeJobLinkElement = page.find_by_id("5yvT8Cy2hbgxPnEoX4G7Bq")
        within findAnFeJobLinkElement do
            expect(findAnFeJobLinkElement).to have_selector '.govuk-body', text: "Find a further education teaching job"
        end
        bottomContactBannerElement = page.find_by_id("57ltZ1kjZ3UMvmAJzCb8Kz")
        within bottomContactBannerElement do
          expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Got a question about training with a local college or training provider?"
          expect(bottomContactBannerElement).to have_selector '.govuk-body', text: "Email: Teach.FE@education.gov.uk and our advisors will reply to you within 5 working days."            
        end
    end

    it "should have the correct classes" do 
        trainingOnTheJobBlock = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
        within trainingOnTheJobBlock do
            expect(trainingOnTheJobBlock[:class]).to eq "app-advice "
        end
        approachesAndGettingStartedBlock = page.find_by_id("1KOfyONjdF71g4vBQYtd5w")
        within approachesAndGettingStartedBlock do
            expect(approachesAndGettingStartedBlock[:class]).to eq ("app-advice ")
        end
        bottomContactBannerBlock = page.find_by_id("57ltZ1kjZ3UMvmAJzCb8Kz")
        within bottomContactBannerBlock do
            expect(bottomContactBannerBlock[:class]).to eq "app-advice "
        end
    end

    it "Links should re-direct to the expected URLs" do
        link = page.find_link("Here's a list of popular teacher training courses.", match: :first)
        within link do 
          expect(link[:href]).to end_with '/full-list-of-fe-qualifications.html'
        end
        link = page.find_link("You may be eligible to apply for a student loan to help pay for the course fees.", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.gov.uk/student-finance'
        end
        link = page.find_link("Train in your own time", match: :first)
        within link do 
          expect(link[:href]).to end_with '/train-in-your-own-time.html'
        end
        link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
        end
        link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
        end
        link = page.find_link("Find a job in FE on the Association of Colleges website", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.aocjobs.com/'
        end
        link = page.find_link("Find a further education teaching job", match: :first)
        within link do 
          expect(link[:href]).to end_with '/find-an-fe-teaching-job.html'
        end
        link = page.find_link("Teach.FE@education.gov.uk", match: :first)
        within link do 
          expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
        end
    end
end