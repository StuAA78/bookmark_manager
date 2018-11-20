require 'pg'

class Bookmark

  def self.all
    array = []

    conn = PG.connect( dbname: 'bookmark_manager' )
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row|
        array << row.values_at('url').first
      end
    end

    array

  end
end
