require 'spec_helper'

describe 'Homepage components', :type => :feature do
    before do
      visit '/'
    end

    it "should have correct elements" do
      youDoNotNeedADegreeElement = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
      within youDoNotNeedADegreeElement do 
        expect(youDoNotNeedADegreeElement).to have_selector 'h2.govuk-heading-l', text: "You do not need a degree to start teaching in further education"
        expect(youDoNotNeedADegreeElement).to have_selector '.govuk-body', count: 2
        expect(youDoNotNeedADegreeElement).to have_selector '.govuk-link', count: 1
      end
  end

    it "should have correct classes" do
      youDoNotNeedADegreeElement = page.find_by_id("11nV0pkqrJOxP6o2F7KVGx")
      within youDoNotNeedADegreeElement do
        expect(youDoNotNeedADegreeElement[:class]).to eq "app-advice shaded"
      end
      rewardsOfTeachingElement = page.find_by_id("8Od3hFGQIxvanljvVEXor")
      within rewardsOfTeachingElement do
        expect(rewardsOfTeachingElement[:class]).to eq "app-columns-wrapper"
      end
      trainOnTheJobElement = page.find_by_id("1GQKTeUn3joIfjBLS0gowy")
      within trainOnTheJobElement do
        expect(trainOnTheJobElement[:class]).to eq "app-summary"
      end
      paidHolidayElement = page.find_by_id("4E3RnU57icaehTEYTxfodo")
      within paidHolidayElement do
        expect(paidHolidayElement[:class]).to eq "app-summary"
      end
      flexibleHoursElement = page.find_by_id("4A8XRFwHX6NkOpW9rVJkvG")
      within flexibleHoursElement do
        expect(flexibleHoursElement[:class]).to eq "app-summary"
      end
      mechanicsStoryElement = page.find_by_id("4cFjarRBPKWpHy8KPITiHp")
      within mechanicsStoryElement do
        expect(mechanicsStoryElement[:class]).to eq "app-story"
      end
      agricultureStoryElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
      within agricultureStoryElement do
        expect(agricultureStoryElement[:class]).to eq "app-story"
      end
      newsletterCtaButtonElement = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      within newsletterCtaButtonElement do
        expect(newsletterCtaButtonElement[:class]).to eq "govuk-button "
      end
    end

    it "should render the correct links" do
      link = page.find_link("Find out if you could teach in FE", match: :first)
      within link do
        expect(link[:href]).to end_with '/where-to-start-in-further-education.html'
      end
      link = page.find_link("Find out more about teaching in FE", match: :first)
      within link do
        expect(link[:href]).to end_with '/where-to-start-in-further-education.html'
      end
      newsletterCtaButton = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
      within newsletterCtaButton do
        expect(newsletterCtaButton[:onClick]).to end_with "sign-up-for-our-newsletter.html'"
      end
    end
  end