require 'pg'

class Bookmark

  def self.all
    array = []
    if ENV['RACK_ENV'] == 'test'
      db = 'bookmark_manager_test'
    else
      db = 'bookmark_manager'
    end
      conn = PG.connect( dbname: db )
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row|
        array << row.values_at('url').first
      end
    end

    array

  end
end
