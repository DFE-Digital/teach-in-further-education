require 'spec_helper'

describe 'Footer', :type => :feature do
    before do 
        visit '/'
    end 

it 'can render a link' do
   link = page.find_by_id('feedback')
   within link do
       within link do 
        have_selector '[/feedback.html]'
    end
 end
end

it 'renders socials icon images' do 
    link = page.find_by_id('instagram')
    within link do 
        have_selector 'img[src=//assets/images/instagram.png]'
    end
end

it 'renders gov uk copyright link' do 
    link = page.find_by_id('copyright')
    within link do 
        have_selector '[nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright.html]'
    end
end
end 