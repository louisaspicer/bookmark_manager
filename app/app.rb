ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  get '/signup' do
    erb :sign_up
  end

  post '/users' do
    User.create(email: params[:email],
                password: params[:password])
    redirect to('/links')
  end

  get '/' do
    erb :index
  end

  get '/links' do
    @linktags = LinkTag.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    if params[:tag].include? ","
      tags = params[:tag].split(",")
      tags.each do |tag|
        link.tags << Tag.create(content: tag)
      end
    else
      tag = Tag.create(content: params[:tag])
      link.tags << tag
    end
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new_link
  end

  post '/tags' do
    session[:filter] = params[:filter]
    redirect to("/tags/#{params[:filter]}")
  end

  get '/tags/*' do
    @linktags = LinkTag.all
    @filter = session[:filter]
    erb :filter

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
