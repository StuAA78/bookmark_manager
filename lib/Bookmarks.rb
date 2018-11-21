require 'pg'

class Bookmark

  def self.all
    array = []
    conn = PG.connect( dbname: environment? )
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.each do |row|
        array << row
      end
    end

    array

  end

  def self.create(url, title)
    conn = PG.connect( dbname: environment? )
    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(id)
    conn = PG.connect( dbname: environment? )
    conn.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  private

  def self.environment?
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

end
