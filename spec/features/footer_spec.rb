require 'spec_helper'

describe 'Footer', :type => :feature do
    before do 
        visit '/'
    end 

    it 'can render a link' do
       link = page.find_by_id('feedback')
       expect(link[:href]).to eq '/feedback.html'  
    end

    it 'renders socials icon images' do 
        link = page.find_by_id('instagram')
        expect(link[:src]).to eq '/assets/images/instagram.png'  
    end

    it 'renders gov uk copyright link' do 
        link = page.find_by_id('copyright')
        expect(link[:href]).to eq 'nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright.html]'
    end
end 
