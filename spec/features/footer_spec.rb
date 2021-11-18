require 'spec_helper'

describe 'Footer', :type => :feature do
    before do 
        visit '/'
    end 

    it 'has the correct content' do
        within 'footer' do
            expect(page).to have_selector '.govuk-footer__inline-list', count: 2
            expect(page).to have_selector '.govuk-footer__licence-logo', count: 1
            expect(page).to have_selector '.govuk-footer__meta-item', count: 2
            expect(page).to have_selector '.govuk-footer__licence-description', count: 1
        end
    end

    it 'renders feedback link' do
        within 'footer' do
            link = page.find_by_id('feedback')
            expect(link[:href]).to eq 'https://forms.gle/93nLpM6mqt5tvRmk8'
        end
    end

    it 'renders cookies link' do
        within 'footer' do
            link = page.find_by_id('cookies')
            expect(link[:href]).to end_with '/cookies.html'
        end
    end

    it 'renders gov uk copyright link' do 
        within 'footer' do
            link = page.find_by_id('copyright')
            expect(link[:href]).to eq 'https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/'
        end
    end

    it 'renders Open Gov License link' do
        within 'footer' do
            link = page.find_link("Open Government Licence v3.0", match: :first)
            expect(link[:href]).to eq 'https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/'
        end
    end
end 
