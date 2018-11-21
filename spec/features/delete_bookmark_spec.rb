feature "deleting bookmarks" do
	scenario "deleting a bookmark using a delete button" do
		visit('/')

    fill_in('New bookmark', :with => 'http://www.facebook.com')
    fill_in('title', :with => "Test bookmark")
    click_button('Submit')
    expect(page).to have_content("Test bookmark")
    click_button('delete')

    expect(page).to_not have_content("Test bookmark")
  end
end