require 'spec_helper'

describe 'Accordion components -', :type => :feature do
  before do
    visit '/what-you-could-teach.html'
  end

    it "should have correct elements" do
        whatYouCouldTeachElement = page.find_by_id("3P8EQuVSSctYjfcJHwZ6H1")
        within whatYouCouldTeachElement do
            expect(whatYouCouldTeachElement).to have_selector '.govuk-body', count: 3
            expect(whatYouCouldTeachElement).to have_selector '.govuk-list--bullet', count: 1
            expect(whatYouCouldTeachElement).to have_selector 'li', count: 4
        end
        accordionBlock = page.find_by_id("7xDb0h6J2h6c11GhWHR0J")
        within accordionBlock do
            expect(accordionBlock).to have_selector 'h2.govuk-accordion__section-heading', text: "Professions, vocations and trades"
            expect(accordionBlock).to have_selector 'h2.govuk-accordion__section-heading', text: "Traditional academic subjects"
            expect(accordionBlock).to have_selector '.govuk-accordion__controls', count: 1
            expect(accordionBlock).to have_selector '.govuk-accordion__section-header', count: 2
        end
        trainingToTeachSubjectElement = page.find_by_id("1inRQaqvmQdjVteK4scloc")
        within trainingToTeachSubjectElement do
            expect(trainingToTeachSubjectElement).to have_selector 'h2.govuk-heading-l', text: "Start teaching your subject"
            expect(trainingToTeachSubjectElement).to have_selector '.govuk-body', count: 1
            expect(trainingToTeachSubjectElement).to have_selector '.govuk-list--bullet', count: 1
            expect(trainingToTeachSubjectElement).to have_selector 'li', count: 2
            expect(trainingToTeachSubjectElement).to have_selector '.govuk-link', count: 2
        end
        contactInfoElement = page.find_by_id("2zZ0KQaTQKpFKh47znfZTk")
        within contactInfoElement do
          expect(contactInfoElement).to have_selector '.govuk-body', count: 2
          expect(contactInfoElement).to have_selector '.govuk-link', count: 1
        end
        wyctStory1 = page.find_by_id("7ABuhsAYVosp5LK1WRKIHT")
        within wyctStory1 do
            expect(wyctStory1.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/n5A2cZFGtaDc4pRp50usP/6b843f80c9e508e8165e955a6efe642c/what_you_can_teach.png?w=475' 
            expect(wyctStory1).to have_selector 'div.call-out-border-left', count: 1
            expect(wyctStory1).to have_selector 'p.govuk-body', text: "“I was looking for a change of career after 35 years on the tools. I'm not getting any younger and I also wanted a break from chasing new business and payments.”"
        end
    end

    it "should have correct classes" do
        whatYouCouldTeachElement = page.find_by_id("3P8EQuVSSctYjfcJHwZ6H1")
        expect(whatYouCouldTeachElement[:class]).to eq "app-advice "

        accordionBlock = page.find_by_id("7xDb0h6J2h6c11GhWHR0J")
        expect(accordionBlock[:class]).to eq "govuk-accordion"

        trainingToTeachSubjectElement = page.find_by_id("1inRQaqvmQdjVteK4scloc")
        expect(trainingToTeachSubjectElement[:class]).to eq "app-advice "

        contactInfoElement = page.find_by_id("2zZ0KQaTQKpFKh47znfZTk")
        expect(contactInfoElement[:class]).to eq "app-advice "

        plumberStoryElement = page.find_by_id("7ABuhsAYVosp5LK1WRKIHT")
        expect(plumberStoryElement[:class]).to eq "app-story"

        newsletterCtaButtonElement = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
        expect(newsletterCtaButtonElement[:class]).to eq "govuk-button "
    end

    it "link should re-direct to expected urls" do
        link = page.find_link("Train on the job", match: :first)
        expect(link[:href]).to end_with '/train-on-the-job.html'

        link = page.find_link("Train in your own time", match: :first)
        expect(link[:href]).to end_with '/train-in-your-own-time.html'

        newsletterCtaButton = page.find_by_id("2PkxkCxeXtOc9yvI3aok46")
        expect(newsletterCtaButton[:onClick]).to end_with "sign-up-for-our-newsletter.html'"
    end
end