require 'pg'

class Bookmark

  def self.all
    array = []
    conn = PG.connect( dbname: environment? )
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row|
        array << row.values_at('url').first
      end
    end

    array

  end

  def self.create(url)
    conn = PG.connect( dbname: environment? )
    conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private

  def self.environment?
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

end
