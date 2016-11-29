require 'spec_helper'

feature "visiting the home page" do
  scenario "visit the home page and see our bookmarks" do
    visit '/'
    expect(page).to have_content("www.reddit.com")
  end
end
