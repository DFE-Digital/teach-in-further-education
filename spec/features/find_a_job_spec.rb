require 'spec_helper'

describe 'Find a job components', :type => :feature do
    before do
      visit '/find-an-fe-teaching-job.html'
    end

    it "should have correct elements" do
      feProvidersElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      within feProvidersElement do 
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'FE providers are independent organisations' 
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 2
        expect(page).to have_selector 'li', count: 2
      end
      moreThanJustCollegesElement = page.find_by_id("1qKKajIJcr8oAqzNVi64ai")
      within moreThanJustCollegesElement do
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'More than just colleges'
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 3
        expect(page).to have_selector 'li', count: 3
      end
      findAJobElement = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      within findAJobElement do 
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'Where to find a job'
        expect(page).to have_selector 'h3.govuk-heading-m', text: 'Colleges'
        expect(page).to have_selector 'h3.govuk-heading-m', text: 'ITPs'
        expect(page).to have_selector 'h4.govuk-heading-s', text: 'Other places to look'
        expect(page).to have_selector '.govuk-list--bullet', count: 2
        expect(page).to have_selector '.govuk-body', count: 5
        expect(page).to have_selector '.govuk-link', count: 6
        expect(page).to have_selector 'li', count: 7
      end
      whatToLookForElement = page.find_by_id("6oUpUuq3gk94Pp5AeRLEwr")
      within whatToLookForElement do
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'What to look for'
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 3
        expect(page).to have_selector 'li', count: 4
      end
      whatYouCouldEarnElement = page.find_by_id("1huyVRCGroXrWmbLnuL0WS")
      within whatYouCouldEarnElement do
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'What you could earn'
        expect(page).to have_selector 'h3.govuk-heading-m', text: 'The average salary for an FE teacher ranges from £24,000 to £40,000'
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 7
        expect(page).to have_selector '.govuk-link', count: 2
        expect(page).to have_selector 'li', count: 3
      end
      benefitsPackageElement = page.find_by_id("2GE7Oj5gaBed42AHKQjNhL")
      within benefitsPackageElement do
        expect(page).to have_selector 'h2.govuk-heading-l', text: 'Benefits package'
        expect(page).to have_selector 'h3.govuk-heading-m', text: 'Working hours'
        expect(page).to have_selector 'h3.govuk-heading-m', text: 'Holidays'
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 9
        expect(page).to have_selector 'li', count: 4
      end
      contactInfoElement = page.find_by_id("6COWqbhmnOaJDejYnd70tI")
      within contactInfoElement do
        expect(page).to have_selector '.govuk-body', count: 2
        expect(page).to have_selector '.govuk-link', count: 1
      end
      nonTeachingRolesElement = page.find_by_id("6AIEMKj7WEqmoh0paGILES")
      within nonTeachingRolesElement do
        expect(page).to have_selector 'h2.govuk-heading-l', count: 1
        expect(page).to have_selector '.govuk-list--bullet', count: 1
        expect(page).to have_selector '.govuk-body', count: 2
        expect(page).to have_selector 'li', count: 3
      end
    end
    
    it "should have correct classes" do
      feProvidersElement = page.find_by_id("3J3oEV3PF62bJRcXhpLDOH")
      expect(feProvidersElement[:class]).to eq "app-advice "

      moreThanJustCollegesElement = page.find_by_id("1qKKajIJcr8oAqzNVi64ai")
      expect(moreThanJustCollegesElement[:class]).to eq "app-advice "

      findAJobElement = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      expect(findAJobElement[:class]).to eq "app-advice "

      whatToLookForElement = page.find_by_id("6oUpUuq3gk94Pp5AeRLEwr")
      expect(whatToLookForElement[:class]).to eq "app-advice "

      whatYouCouldEarnElement = page.find_by_id("1huyVRCGroXrWmbLnuL0WS")
      expect(whatYouCouldEarnElement[:class]).to eq "app-advice "

      benefitsPackageElement = page.find_by_id("2GE7Oj5gaBed42AHKQjNhL")
      expect(benefitsPackageElement[:class]).to eq "app-advice "

      contactInfoElement = page.find_by_id("6COWqbhmnOaJDejYnd70tI")
      expect(contactInfoElement[:class]).to eq "app-advice "

      nonTeachingRolesElement = page.find_by_id("6AIEMKj7WEqmoh0paGILES")
      expect(contactInfoElement[:class]).to eq "app-advice "

      newsletterCtaButtonElement = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      expect(newsletterCtaButtonElement[:class]).to eq "govuk-button "
    end

    it "links should re-direct to expected urls" do
      whatYouCouldEarnBlock = page.find_by_id("3Vcwz7UfYGsdI7gkI4iWgh")
      within whatYouCouldEarnBlock do
        link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
        end
        link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website")
        within link do
          expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
        end
        link = page.find_link("Association of colleges job site")
        within link do 
          expect(link[:href]).to eq 'https://www.aocjobs.com/'
        end
        link = page.find_link("TES - Times Educational Supplement job site")
        within link do 
          expect(link[:href]).to eq 'https://www.tes.com/jobs/browse/further-education-teaching-and-lecturing'
        end
        link = page.find_link("Further Education job site")
        within link do 
          expect(link[:href]).to eq 'https://www.fejobs.com/career-advice'
        end
        link = page.find_link("College Jobs")
        within link do 
          expect(link[:href]).to eq 'https://college.jobs.ac.uk/'
        end
      end
      whatYouCouldEarnBlock = page.find_by_id("1huyVRCGroXrWmbLnuL0WS")
      within whatYouCouldEarnBlock do
        link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
        within link do 
          expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
        end
        link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website")
        within link do
          expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
        end
      end
      contactInfoElement = page.find_by_id("6COWqbhmnOaJDejYnd70tI")
      within contactInfoElement do
        link = page.find_link("Teach.FE@education.gov.uk")
        within link do
          expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
        end
      end
      newsletterCtaButton = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      within newsletterCtaButton do
        expect(newsletterCtaButton[:onClick]).to end_with "sign-up-for-our-newsletter.html'"
      end
    end
end