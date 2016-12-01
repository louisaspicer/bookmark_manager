def create_linktag
  visit '/links/new'
  fill_in('title', with: 'Bookface')
  fill_in('url', with: 'www.bookface.com')
  fill_in('tag', with: 'facebook')
  click_button('Submit')
end
