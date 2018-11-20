feature "adding bookmarks" do
  scenario "adding a bookmark via a form" do
    visit('/')

    fill_in('New bookmark', :with => 'http://www.facebook.com')
    click_button('Submit')

    visit('/bookmarks')
    expect(page).to have_content "http://www.facebook.com"

  end
end
