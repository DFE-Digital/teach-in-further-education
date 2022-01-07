require 'spec_helper'

describe 'Full list of FE qualifications page', :type => :feature do
    before do 
        visit '/full-list-of-fe-qualifications.html'
    end 

    it "should have correct elements" do
        introductoryQualificationsElement = page.find_by_id("6MLGVV5W7puMHUOyCQw5PO")
        within introductoryQualificationsElement do
            expect(introductoryQualificationsElement).to have_selector 'h2.govuk-heading-l', text: "Introductory qualifications"
            expect(introductoryQualificationsElement).to have_selector '.govuk-body', count: 4
            expect(introductoryQualificationsElement).to have_selector '.govuk-link', count: 3
            expect(introductoryQualificationsElement).to have_selector 'h3.govuk-heading-m', text: "These qualifications are good if you:"
            expect(introductoryQualificationsElement).to have_selector 'h3.govuk-heading-m', text: "These might not be the right qualifications if you want to:"
            expect(introductoryQualificationsElement).to have_selector 'caption.govuk-table__caption--m', text: "About these courses"
            expect(introductoryQualificationsElement).to have_selector '.govuk-list--bullet', count: 2
            expect(introductoryQualificationsElement).to have_selector 'li', count: 6
            expect(introductoryQualificationsElement).to have_selector 'table.govuk-table', count: 1
        end

        diplomaInEducationAndTrainingElement = page.find_by_id("GUGtg9Vxo8cZQblsYPoGc")
        within diplomaInEducationAndTrainingElement do
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h2.govuk-heading-l', text: "Diploma in Education and Training"
            expect(diplomaInEducationAndTrainingElement).to have_selector '.govuk-body', count: 5
            expect(diplomaInEducationAndTrainingElement).to have_selector '.govuk-link', count: 4
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h3.govuk-heading-m', text: "This qualification is good if you want to:"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h3.govuk-heading-m', text: "This might not be the right qualification if you want to:"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h3.govuk-heading-m', text: "Integrated Specialist Diploma"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'caption.govuk-table__caption--m', text: "About this course"
            expect(diplomaInEducationAndTrainingElement).to have_selector '.govuk-list--bullet', count: 3
            expect(diplomaInEducationAndTrainingElement).to have_selector 'li', count: 10
            expect(diplomaInEducationAndTrainingElement).to have_selector 'table.govuk-table', count: 1
        end
        pgceAndPcetElement= page.find_by_id("5FbxLwEjMguAEiyxkmTuka")
        within pgceAndPcetElement do
            expect(pgceAndPcetElement).to have_selector 'h2.govuk-heading-l', text: "PGCE/CertEd etc in post-compulsory education and training (PCET)"
            expect(pgceAndPcetElement).to have_selector '.govuk-body', count: 4
            expect(pgceAndPcetElement).to have_selector '.govuk-link', count: 4
            expect(pgceAndPcetElement).to have_selector 'h3.govuk-heading-m', text: "This qualification is good if you want to:"
            expect(pgceAndPcetElement).to have_selector 'h3.govuk-heading-m', text: "This might not be the right qualification if you want to:"
            expect(pgceAndPcetElement).to have_selector 'caption.govuk-table__caption--m', text: "About this course"
            expect(pgceAndPcetElement).to have_selector '.govuk-list--bullet', count: 2
            expect(pgceAndPcetElement).to have_selector 'li', count: 6
            expect(pgceAndPcetElement).to have_selector 'table.govuk-table', count: 1
        end
    end

    it "should have correct classes" do
        introductoryQualificationsBlock = page.find_by_id("6MLGVV5W7puMHUOyCQw5PO")
        expect(introductoryQualificationsBlock[:class]).to eq 'app-advice ' 

        diplomaInEducationAndTrainingBlock = page.find_by_id("GUGtg9Vxo8cZQblsYPoGc")
        expect(diplomaInEducationAndTrainingBlock[:class]).to eq 'app-advice ' 

        pgceAndPcetBlock = page.find_by_id("5FbxLwEjMguAEiyxkmTuka")
        expect(pgceAndPcetBlock[:class]).to eq 'app-advice '
    end

    it "links should re-direct to expected urls" do
        link = page.find_link("What levels mean", match: :first)
        expect(link[:href]).to end_with 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'

        link = page.find_link("Get in to Teaching")
        expect(link[:href]).to eq 'https://getintoteaching.education.gov.uk/'

        link = page.find_link("Find a post-graduate teaching course")
        expect(link[:href]).to eq 'https://www.find-postgraduate-teacher-training.service.gov.uk/'
    end
end