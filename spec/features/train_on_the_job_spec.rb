require 'spec_helper'

describe 'Train On The Job components', :type => :feature do
    before do
        visit '/train-on-the-job.html'
    end

    it "should have correct elements" do
        trainingOnTheJobElement = page.find_by_id("5cu3CALGtvPugA7rbdsPwW")
        within trainingOnTheJobElement do
            has_css? 'govuk-heading-l', count: 1
            has_css? 'govuk-body', count: 5
        end
        approachesAndGetStartedElement = page.find_by_id("1KOfyONjdF71g4vBQYtd5w")
        within approachesAndGetStartedElement do
            has_css? 'govuk-heading-m', count: 3
            has_css? 'govuk-list govuk-list--bullet', count: 2
            has_css? 'li', count: 7
        end
        findAnFeJobLinkElement = page.find_by_id("5yvT8Cy2hbgxPnEoX4G7Bq")
        within findAnFeJobLinkElement do
            has_css? 'govuk-body', count: 1
        end
        bottomContactBannerElement = page.find_by_id("57ltZ1kjZ3UMvmAJzCb8Kz")
        within bottomContactBannerElement do
            has_css? 'govuk-body', count: 2            
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
          expect(link[:href]).to include '/full-list-of-fe-qualifications.html'
        end
        link = page.find_link("You may be eligible to apply for a student loan to help pay for the course fees.", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.gov.uk/student-finance'
        end
        link = page.find_link("Train in your own time", match: :first)
        within link do 
          expect(link[:href]).to include '/train-in-your-own-time.html'
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
          expect(link[:href]).to include '/find-an-fe-teaching-job.html'
        end
        link = page.find_link("Teach.FE@education.gov.uk", match: :first)
        within link do 
          expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
        end
    end
end