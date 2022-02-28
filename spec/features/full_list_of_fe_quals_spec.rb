require 'spec_helper'

describe 'Full list of FE qualifications page', :type => :feature do
    before do 
        visit '/full-list-of-fe-qualifications.html'
    end 

    it "should have correct elements" do
        trainingCourseInformationElement = page.find_by_id("2LO1IwLBcK7y7jwOkATnv1")
        within trainingCourseInformationElement do
            expect(trainingCourseInformationElement).to have_selector 'h2.govuk-heading-l', text: "Training course information"
            expect(trainingCourseInformationElement).to have_selector 'table.govuk-table', count: 1
            #table headers
            expect(trainingCourseInformationElement).to have_selector 'tr', count: 8
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Course structure"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Level of qualification you will get"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Area of education (Primary, Secondary, FE)"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Teaching status"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Cost (varies by provider)"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Course length"
            expect(trainingCourseInformationElement).to have_selector 'th', text: "Entry requirements"
            #out of table
            expect(trainingCourseInformationElement).to have_selector 'h3.govuk-heading-m', text: "These qualifications are good if you want to:"
            expect(trainingCourseInformationElement).to have_selector 'h3.govuk-heading-m', text: "These are not the best qualifications if you want to:"
            expect(trainingCourseInformationElement).to have_selector 'ul.govuk-list--bullet', count: 2
            expect(trainingCourseInformationElement).to have_selector 'li', count: 4
        end

        diplomaInEducationAndTrainingElement = page.find_by_id("GUGtg9Vxo8cZQblsYPoGc")
        within diplomaInEducationAndTrainingElement do
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h2.govuk-heading-l', text: "Diploma in Education and Training"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h3.govuk-heading-m', text: "What you need to access this course"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'h3.govuk-heading-m', text: "What you'll achieve"
            expect(diplomaInEducationAndTrainingElement).to have_selector 'p.govuk-body', count: 2
            expect(diplomaInEducationAndTrainingElement).to have_selector 'a.govuk-link', text: 'What levels mean', count: 2
        end

        certificateInEducationElement = page.find_by_id("1ex0CmvfE4cIkmR35z5s6F")
        within certificateInEducationElement do
            expect(certificateInEducationElement).to have_selector 'h2.govuk-heading-l', text: "Certificate in Education"
            expect(certificateInEducationElement).to have_selector 'h3.govuk-heading-m', text: "What you need to access this course"
            expect(certificateInEducationElement).to have_selector 'h3.govuk-heading-m', text: "What you'll achieve"
            expect(certificateInEducationElement).to have_selector 'p.govuk-body', count: 2
            expect(certificateInEducationElement).to have_selector 'a.govuk-link', text: 'What levels mean', count: 2
        end

        professionalGradeCertificateinEductionElement = page.find_by_id("5FbxLwEjMguAEiyxkmTuka")
        within professionalGradeCertificateinEductionElement do
            expect(professionalGradeCertificateinEductionElement).to have_selector 'h2.govuk-heading-l', text: "Professional Graduate Certificate in Education"
            expect(professionalGradeCertificateinEductionElement).to have_selector 'h3.govuk-heading-m', text: "What you need to access this course"
            expect(professionalGradeCertificateinEductionElement).to have_selector 'h3.govuk-heading-m', text: "What you'll achieve"
            expect(professionalGradeCertificateinEductionElement).to have_selector 'p.govuk-body', count: 2
            expect(professionalGradeCertificateinEductionElement).to have_selector 'a.govuk-link', text: 'What levels mean', count: 2
        end

        postgraduateCertificateInEducationElement = page.find_by_id("2YeTVctrsZ2nTADx2hfHKa")
        within postgraduateCertificateInEducationElement do
            expect(postgraduateCertificateInEducationElement).to have_selector 'h2.govuk-heading-l', text: "Postgraduate Certificate in Education"
            expect(postgraduateCertificateInEducationElement).to have_selector 'h3.govuk-heading-m', text: "What you need to access this course"
            expect(postgraduateCertificateInEducationElement).to have_selector 'h3.govuk-heading-m', text: "What you'll achieve"
            expect(postgraduateCertificateInEducationElement).to have_selector 'p.govuk-body', count: 2
            expect(postgraduateCertificateInEducationElement).to have_selector 'a.govuk-link', text: 'What levels mean', count: 1
        end
    end

    it "should have correct classes" do
        trainingCourseInformationBlock = page.find_by_id("2LO1IwLBcK7y7jwOkATnv1")
        expect(trainingCourseInformationBlock[:class]).to eq 'app-advice ' 

        diplomaInEducationAndTrainingBlock = page.find_by_id("GUGtg9Vxo8cZQblsYPoGc")
        expect(diplomaInEducationAndTrainingBlock[:class]).to eq 'app-advice ' 

        certificateInEducationBlock = page.find_by_id("1ex0CmvfE4cIkmR35z5s6F")
        expect(certificateInEducationBlock[:class]).to eq 'app-advice '

        professionalGradeCertificateinEductionBlock = page.find_by_id("5FbxLwEjMguAEiyxkmTuka")
        expect(professionalGradeCertificateinEductionBlock[:class]).to eq 'app-advice '

        postgraduateCertificateInEducationBlock = page.find_by_id("2YeTVctrsZ2nTADx2hfHKa")
        expect(postgraduateCertificateInEducationBlock[:class]).to eq 'app-advice '
    end

    it "links should re-direct to expected urls" do
        link = page.find_link("What levels mean", match: :first)
        expect(link[:href]).to end_with 'https://www.gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels'

        link = page.find_link("student loan")
        expect(link[:href]).to eq 'https://www.gov.uk/government/organisations/student-loans-company'
    end
end