require './app/app'

RSpec.feature "Filtering a tag", :type => :feature do
  scenario "user can find links with a tag" do
    DatabaseCleaner.clean
    create_bookface
    create_bubbles
    visit '/'
    fill_in('filter', with: 'bubbles')
    click_button('Submit')

    expect(page).to have_content('Shooter Bubble')
    expect(page).not_to have_content('Bookface')
  end

  end
