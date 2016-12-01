ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
require 'pry'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
  end

  get '/links' do
    @linktags = LinkTag.all
    erb :links
  end

  post '/links' do

    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(content: params[:tag])
    # binding.pry
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new_link
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
