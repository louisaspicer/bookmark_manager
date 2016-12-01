require './app/app'

RSpec.feature "Creating a tag", :type => :feature do
  scenario "user creates a tag for a new link" do
    DatabaseCleaner.clean

    visit '/links/new'

    expect(page.status_code).to eq 200

    fill_in('title', with: 'Peaspod')
    fill_in('url', with: 'http://peaspod.co.uk')
    fill_in('tag', with: 'gallery')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:content)).to include('gallery')
  end



  end
