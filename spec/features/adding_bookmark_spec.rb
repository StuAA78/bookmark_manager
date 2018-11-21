feature "adding bookmarks" do
  scenario "adding a bookmark via a form" do
    visit('/')

    fill_in('New bookmark', :with => 'http://www.facebook.com')
    fill_in('title', :with => 'facebook')
    click_button('Submit')

    visit('/bookmarks')
    expect(page).to have_content "facebook"
  end
end
