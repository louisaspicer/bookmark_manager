require './app/app'

RSpec.feature "Viewing links", :type => :feature do
  scenario "shows a list of links on the homepage" do
    DatabaseCleaner.clean
    create_linktag
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#linktags' do
      message = "Bookface"
      expect(page).to have_content(message)
    end
  end
end
