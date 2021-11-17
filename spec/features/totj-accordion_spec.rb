require 'spec_helper'

describe 'Accordion components -', :type => :feature do
  before do
    visit '/totj-accordion.html'

    #expand all accordions
    find('button.govuk-accordion__open-all').click()

  end

  it "should have correct elements" do
    #assert the page level for an accordion
    expect(page).to have_selector '.govuk-accordion', count: 1

    #find the accordion content block and assert within that
    accordionBlock = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
    within accordionBlock do
      expect(accordionBlock).to have_selector '.govuk-accordion__open-all', count: 1
      expect(accordionBlock).to have_selector '.govuk-accordion__section', count: 3
      expect(accordionBlock).to have_selector '.govuk-accordion__icon', count: 3

      #assert the accordion headings
      expect(accordionBlock).to have_selector '.govuk-accordion__section-heading', text: "What you need to teach in further education"
      expect(accordionBlock).to have_selector '.govuk-accordion__section-heading', text: "Pay, conditions, and benefits"
      expect(accordionBlock).to have_selector '.govuk-accordion__section-heading', text: "Find a further education teaching job"
    end

    #find 1st accordion and assert content
    accordion1 = page.find_by_id("5bl9sYZHo3Zns6ojkVwqrL")
    within accordion1 do
      expect(accordion1).to have_selector '.govuk-body', count: 11
      expect(accordion1).to have_selector '.govuk-list--bullet', count: 3
      expect(accordion1).to have_selector 'li', count: 7
      expect(accordion1).to have_selector '.govuk-link', count: 4
    end

    #find 2nd accordion and assert content
    accordion2 = page.find_by_id("accordion-default-content-1")
    within accordion2 do
      expect(accordion2).to have_selector '.govuk-heading-m', count: 5
      expect(accordion2).to have_selector '.govuk-body', count: 22
      expect(accordion2).to have_selector '.govuk-list--bullet', count: 3
      expect(accordion2).to have_selector 'li', count: 10
      expect(accordion2).to have_selector '.govuk-link', count: 5
    end

    #find 3rd accordion and assert content
    accordion3 = page.find_by_id("accordion-default-content-2")
    within accordion3 do
      expect(accordion3).to have_selector '.govuk-heading-m', count: 1
      expect(accordion3).to have_selector '.govuk-body', count: 6
      expect(accordion3).to have_selector '.govuk-list--bullet', count: 2
      expect(accordion3).to have_selector 'li', count: 6
      expect(accordion3).to have_selector '.govuk-link', count: 6
    end
  end

  it "first accordion should render the correct links" do
    link = page.find_link("What levels mean", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
    end
    link = page.find_link("Train on the jo", match: :first)
    within link do
      expect(link[:href]).to end_with '/train-on-the-job.html'
    end
    link = page.find_link("Train in your own time", match: :first)
    within link do
      expect(link[:href]).to end_with '/train-in-your-own-time.html'
    end
    link = page.find_link("Here's a list of popular teacher training courses", match: :first)
    within link do
      expect(link[:href]).to end_with '/full-list-of-fe-qualifications.html'
    end
  end

  it "second accordion should render the correct links" do
   link = page.find_link("According to the National Careers Service the average salary for an FE teacher ranges from £24,000 to £37,000", match: :first)
    within link do
      expect(link[:href]).to eq 'https://nationalcareers.service.gov.uk/job-profiles/further-education-lecturer'
    end
    link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
    end
    link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
    end
    link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
    end
    link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website", match: :first)
    within link do
      expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
    end
  end

  it "third accordion should render the correct links" do
    link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
     within link do
       expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
     end
     link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website", match: :first)
     within link do
       expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
     end
     link = page.find_link("Association of colleges job site", match: :first)
     within link do
       expect(link[:href]).to eq 'https://www.aocjobs.com/'
     end
     link = page.find_link("Times Educational Supplement job site", match: :first)
     within link do
       expect(link[:href]).to eq 'https://www.tes.com/jobs/browse/further-education-teaching-and-lecturing'
     end
     link = page.find_link("Further Education job site", match: :first)
     within link do
       expect(link[:href]).to eq 'https://www.fejobs.com/career-advice'
     end
     link = page.find_link("College Jobs", match: :first)
     within link do
       expect(link[:href]).to eq 'https://college.jobs.ac.uk/'
     end
   end
end