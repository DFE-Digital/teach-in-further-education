require 'spec_helper'

describe 'Where to start in fe components', :type => :feature do
    before do
      visit '/where-to-start-in-further-education.html'
    end

    it "should have correct elements" do
      whatIsFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within whatIsFurtherEducationElement do 
        expect(whatIsFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'What is further education?'
        expect(whatIsFurtherEducationElement).to have_selector '.govuk-body', count: 3
        expect(whatIsFurtherEducationElement).to have_selector '.govuk-list--bullet', count: 1
        expect(whatIsFurtherEducationElement).to have_selector 'li', count: 5
      end
      whatYouCouldEarnElement = page.find_by_id("1huyVRCGroXrWmbLnuL0WS")
      within whatYouCouldEarnElement do
        expect(whatYouCouldEarnElement).to have_selector 'h2.govuk-heading-l', text: 'What you could earn'
        expect(whatYouCouldEarnElement).to have_selector 'h3.govuk-heading-m', text: 'The average salary for an FE teacher ranges from £24,000 to £40,000'
        expect(whatYouCouldEarnElement).to have_selector '.govuk-body', count: 7
        expect(whatYouCouldEarnElement).to have_selector '.govuk-list--bullet', count: 1
        expect(whatYouCouldEarnElement).to have_selector 'li', count: 3
        expect(whatYouCouldEarnElement).to have_selector '.govuk-link', count: 2
      end
      whereYouCouldWorkElement = page.find_by_id("1Yh0k872wyhVl5GgFnlyDy")
      within whereYouCouldWorkElement do
        expect(whereYouCouldWorkElement).to have_selector 'h2.govuk-heading-l', text: 'Where you could work'
        expect(whereYouCouldWorkElement).to have_selector '.govuk-body', count: 2
        expect(whereYouCouldWorkElement).to have_selector '.govuk-list--bullet', count: 2
        expect(whereYouCouldWorkElement).to have_selector 'li', count: 6
      end
      findOutIfYouCouldTeachElement = page.find_by_id("5Cnx3y5NVUzVqBb56MUYWT")
      within findOutIfYouCouldTeachElement do
        expect(findOutIfYouCouldTeachElement).to have_selector 'h2.govuk-heading-l', text: 'Find out if you could teach in further education'
        expect(findOutIfYouCouldTeachElement).to have_selector 'h3.govuk-heading-m', text: "You'll need to study teacher training."
        expect(findOutIfYouCouldTeachElement).to have_selector '.govuk-body', count: 9
        expect(findOutIfYouCouldTeachElement).to have_selector '.govuk-list--bullet', count: 2
        expect(findOutIfYouCouldTeachElement).to have_selector 'li', count: 5
        expect(findOutIfYouCouldTeachElement).to have_selector '.govuk-link', count: 2
      end
      whatTeachingInFEIsLikeElement = page.find_by_id("48XICVJXXcyBGAZ2DhtvhD")
      within whatTeachingInFEIsLikeElement do
        expect(whatTeachingInFEIsLikeElement).to have_selector 'h2.govuk-heading-l', text: 'What teaching in further education is like'
        expect(whatTeachingInFEIsLikeElement).to have_selector '.govuk-body', count: 5
      end
      contactInfoElement = page.find_by_id("44UAig0m5n9sKt551BKgI1")
      within contactInfoElement do
        expect(contactInfoElement).to have_selector '.govuk-body', count: 2
        expect(contactInfoElement).to have_selector '.govuk-link', count: 1
      end
      farmerStoryElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
      within farmerStoryElement do
        expect(farmerStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/7ejtw2cz4ilNditvMdrh68/93c2e1cc97ac7d9c02bc5a4a0dce2a01/AgricultureLearning2.png?w=475' 
        expect(farmerStoryElement).to have_selector 'div.call-out-border-right', count: 1
        expect(farmerStoryElement).to have_selector 'p.govuk-body', text: "“You know when you're in another job and it’s the same every day? Here no day’s a chore. I’m surrounded by people who have enthusiasm for what I've been doing all my life.”"
        expect(farmerStoryElement).to have_selector 'p.govuk-body', text: "Margaret, FE agriculture teacher"
      end
      # mathematicsTeacherStoryElement = page.find_by_id("4us8OYWskMdExFNNypuUKE")
      # within mathematicsTeacherStoryElement do
      #   expect(mathematicsTeacherStoryElement).to have_selector 'div.call-out-border-right', count: 1
      #   expect(mathematicsTeacherStoryElement).to have_selector 'p.govuk-body', text: "I love the flexibility that comes with the job. I can go for a bike ride or a swim in the morning some days as my classes are in the afternoon and evening."
      #   expect(mathematicsTeacherStoryElement).to have_selector 'p.govuk-body', text: "Sarah, FE mathematics teacher"
      #   expect(mathematicsTeacherStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/lI0hWqdJ9MJiZphs8126w/b712a01091e5ee4e58154f821cfcdcc9/Sarah-sStory.png?w=475'
      # end
    end

    it "should have correct classes" do
      whatIsFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      expect(whatIsFurtherEducationElement[:class]).to eq "app-advice "

      whatYouCouldEarnElement = page.find_by_id("1huyVRCGroXrWmbLnuL0WS")
      expect(whatYouCouldEarnElement[:class]).to eq "app-advice "

      whereYouCouldWorkElement = page.find_by_id("1Yh0k872wyhVl5GgFnlyDy")
      expect(whereYouCouldWorkElement[:class]).to eq "app-advice "

      findOutIfYouCouldTeachElement = page.find_by_id("5Cnx3y5NVUzVqBb56MUYWT")
      expect(findOutIfYouCouldTeachElement[:class]).to eq "app-advice "

      whatTeachingInFEIsLikeElement = page.find_by_id("48XICVJXXcyBGAZ2DhtvhD")
      expect(whatTeachingInFEIsLikeElement[:class]).to eq "app-advice "

      contactInfoElement = page.find_by_id("44UAig0m5n9sKt551BKgI1")
      expect(contactInfoElement[:class]).to eq "app-advice "

      farmerStoryElement = page.find_by_id("ocv0Q8ArIy3v0dUyNDIGB")
      within farmerStoryElement do
        expect(farmerStoryElement[:class]).to eq "app-story"
      end
    end

    it "link should re-direct to expected urls" do
      link = page.find_link("Find your local FE college on the Association of Colleges website", match: :first)
      within link do 
        expect(link[:href]).to eq 'https://www.aocjobs.com/employers-a-z'
      end
      link = page.find_link("Find independent training providers on the Association of Employment Learning Providers' website")
      within link do
        expect(link[:href]).to eq 'https://www.aelp.org.uk/about/our-members/'
      end
      link = page.find_link("What levels mean")
      within link do 
        expect(link[:href]).to eq 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'
      end
      link = page.find_link("Find out what you could teach")
      within link do
        expect(link[:href]).to end_with '/what-you-could-teach.html'
      end
      link = page.find_link("Teach.FE@education.gov.uk")
      within link do
        expect(link[:href]).to eq 'mailto:Teach.FE@education.gov.uk'
      end
    end
  end