def create_bookface
  visit '/'
  click_button("Add new link")
  fill_in('title', with: 'Bookface')
  fill_in('url', with: 'www.bookface.com')
  fill_in('tag', with: 'facebook')
  click_button('Submit')
end

def create_bubbles
  visit '/'
  click_button("Add new link")
  fill_in('title', with: 'Shooter Bubble')
  fill_in('url', with: 'http://www.shooter-bubble.com/')
  fill_in('tag', with: 'bubbles')
  click_button('Submit')
end

def sign_up
  visit '/signup'
  fill_in('email', with: 'louisaspicer@aol.com')
  fill_in('password', with: 'dude')
  click_button('Sign up')
end
