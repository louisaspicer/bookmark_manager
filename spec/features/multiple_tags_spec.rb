require './app/app'

RSpec.feature "Multiple Tags", :type => :feature do
  scenario "user adds a link with multiple tags" do
  DatabaseCleaner.clean
  visit '/'
  click_button("Add new link")
  fill_in('title', with: 'Bookface')
  fill_in('url', with: 'www.bookface.com')
  fill_in('tag', with: 'facebook,bookface,books,faces')
  click_button('Submit')

  link = Link.first
  expect(link.tags.map(&:content)).to include('facebook')
  expect(link.tags.map(&:content)).to include('bookface')
  expect(link.tags.map(&:content)).to include('books')
  expect(link.tags.map(&:content)).to include('faces')
  end



end
