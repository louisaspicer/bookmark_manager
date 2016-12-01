require 'spec_helper'

feature "Creating tags" do
  scenario "Add a tag to a link" do

    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('URL', with: 'www.google.co.uk')
    fill_in('tags', with: 'search engine')
    click_button('Submit')

    within 'ul#links' do
      expect(page).to have_content('search engine')
    end
  end
end
