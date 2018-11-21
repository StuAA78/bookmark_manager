require 'Bookmarks'

describe Bookmark do

  before(:each) do
    setup_test_database
  end

  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('http://www.makersacademy.com', "Makers")
      Bookmark.create('http://www.destroyallsoftware.com', "Destroy All Software")
      Bookmark.create('http://www.google.com', "Google")

      bookmarks = Bookmark.all
      expect(bookmarks).to include("Google")
      expect(bookmarks).to include("Makers")
      expect(bookmarks).to include("Destroy All Software")
    end
  end
end
