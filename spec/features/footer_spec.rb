require 'spec_helper'

describe 'Footer', :type => :feature do
    before do 
        visit '/'
    end 

    it 'can render a link' do
       link = page.find_by_id('feedback')
       expect(link[:href]).to match 'https://forms.gle/93nLpM6mqt5tvRmk8'
    end

    it 'renders gov uk copyright link' do 
        link = page.find_by_id('copyright')
        expect(link[:href]).to eq 'https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/'
    end
end 
