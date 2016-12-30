require './app/app'

RSpec.feature "Multiple users" do
  scenario "Logging in" do
    DatabaseCleaner.clean
    sign_up

    expect(page).to have_content('Welcome')
    expect(page).to have_content('Welcome louisaspicer@aol.com')
    expect{sign_up}.to change(User, :count).by(1)
  end

end
