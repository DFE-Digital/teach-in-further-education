require 'spec_helper'

describe 'Guide to FE teaching components', :type => :feature do
    before do
      visit '/guide-to-further-education.html'
    end

    it "should have correct elements" do
      guideToFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within guideToFurtherEducationElement do 
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', count: 5
        expect(guideToFurtherEducationElement).to have_selector 'h3.govuk-heading-m', count: 2
        expect(guideToFurtherEducationElement).to have_selector '.govuk-body', count: 28
        expect(guideToFurtherEducationElement).to have_selector '.govuk-list--bullet', count: 7
        expect(guideToFurtherEducationElement).to have_selector 'li', count: 42
      end
      plumberStoryElement = page.find_by_id("7ABuhsAYVosp5LK1WRKIHT")
      within plumberStoryElement do
        expect(plumberStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/n5A2cZFGtaDc4pRp50usP/a9de9589fdc5e020f42c26de51814a92/John-sStory.png?w=475' 
        expect(plumberStoryElement).to have_selector 'div.call-out-border-left', count: 1
        expect(plumberStoryElement).to have_selector 'p.govuk-body', text: "I was looking for a change of career after 35 years as a plumber. I'm not getting any younger and I also wanted a break from chasing new business and payments."
        expect(plumberStoryElement).to have_selector 'p.govuk-body', text: "John, Plumbing FE teacher"
      end
      mathematicsTeacherStoryElement = page.find_by_id("4us8OYWskMdExFNNypuUKE")
      within mathematicsTeacherStoryElement do
        expect(mathematicsTeacherStoryElement).to have_selector 'div.call-out-border-right', count: 1
        expect(mathematicsTeacherStoryElement).to have_selector 'p.govuk-body', text: "I love the flexibility that comes with the job. I can go for a bike ride or a swim in the morning some days as my classes are in the afternoon and evening."
        expect(mathematicsTeacherStoryElement).to have_selector 'p.govuk-body', text: "Sarah, FE mathematics teacher"
        expect(mathematicsTeacherStoryElement.find('img')[:src]).to eq 'http://images.ctfassets.net/n4docnlbw89d/lI0hWqdJ9MJiZphs8126w/b712a01091e5ee4e58154f821cfcdcc9/Sarah-sStory.png?w=475'
      end
    end

    it "should have correct headings" do
      guideToFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within guideToFurtherEducationElement do
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'Where you could work'
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'What you could teach'
        expect(guideToFurtherEducationElement).to have_selector 'h3.govuk-heading-m', text: 'Teaching skills and trades'
        expect(guideToFurtherEducationElement).to have_selector 'h4.govuk-heading-s', text: 'Subject areas'
        expect(guideToFurtherEducationElement).to have_selector 'h3.govuk-heading-m', text: 'Teaching academic subjects'
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'What teaching in further education is like'
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'Work part-time or full-time'
        expect(guideToFurtherEducationElement).to have_selector 'h2.govuk-heading-l', text: 'Non-teaching roles'
      end
    end

    it "should have correct classes" do
      guideToFurtherEducationElement = page.find_by_id("6iPzcLN3pGn52PXP2lQlMC")
      within guideToFurtherEducationElement do
        expect(guideToFurtherEducationElement[:class]).to eq "app-advice "
      end
      accordionElement = page.find_by_id("26o7zVgA8zuq4GnxJgvjD8")
      within accordionElement do
        expect(accordionElement[:class]).to eq "govuk-accordion"
      end
      storyElement = page.find_by_id("7ABuhsAYVosp5LK1WRKIHT")
      within storyElement do
        expect(storyElement[:class]).to eq "app-story"
      end
      storyElement = page.find_by_id("4us8OYWskMdExFNNypuUKE")
      within storyElement do
        expect(storyElement[:class]).to eq "app-story"
      end
    end

    it "link should re-direct to expected urls" do
      link = page.find_link("If you have significant career experience, you may be able to start teaching with an FE provider", match: :first)
      within link do 
        expect(link[:href]).to include "/train-on-the-job.html"       
      end
    end
  end