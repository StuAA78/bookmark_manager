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
  title = params['title']
  Bookmark.create(url, title)
  redirect '/bookmarks'
end

get '/added_bookmark' do
  erb :added_bookmark
end

get '/:id/update' do
  id = params[:id]
  @bookmark = Bookmark.retrieve_bookmark(id)
  erb :update
end

patch '/:id/update' do
  id = params[:id]
  url = params['url']
  title = params['title']
  Bookmark.update_bookmark(id, url, title)
  redirect '/bookmarks'
end

delete '/:id/delete' do
	id = params[:id]
	Bookmark.delete(id)
	redirect('/bookmarks')
end

  run! if app_file == $0
end
