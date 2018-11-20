require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base

get '/' do
  erb(:index)
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb(:list)
end

post '/add_bookmark' do
  url = params['New bookmark']
  Bookmark.create(url)
  redirect '/added_bookmark'
end

get '/added_bookmark' do
  erb :added_bookmark
end


  run! if app_file == $0
end
