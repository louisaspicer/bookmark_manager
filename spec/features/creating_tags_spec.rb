require './app/app'

RSpec.feature "Creating a tag", :type => :feature do
  scenario "user creates a tag for a new link" do
    DatabaseCleaner.clean
    create_bookface

    link = Link.first
    expect(link.tags.map(&:content)).to include('facebook')
  end

  end
