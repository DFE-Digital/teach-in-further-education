require 'spec_helper'

describe 'Pages should be accessible', :type => :feature do
  Dir.glob("data/site/pages/**/*.yaml").each do |file|
    p = YAML.load(File.read(file))
    it "Ensure #{p[:slug]} is axe compliant" do
      visit "/#{p[:slug]}"
      expect(page).to be_axe_clean
    end
  end
end
