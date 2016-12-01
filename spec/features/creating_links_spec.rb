require './app/app'

RSpec.feature "Creating Link", :type => :feature do
  scenario "should allow the user to create a new link" do
  DatabaseCleaner.clean
  create_bookface

  expect(page).to have_content('Bookface')
  end



end
