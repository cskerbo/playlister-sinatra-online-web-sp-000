require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])

    artist = Artist.find_by(name: params[:song][:artist])
    if artist == nil
      @song.artist = Artist.create(name: params[:song][:artist])
    else
      @song.artist = artist
    end
    @song.save


    redirect to("songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :'songs/show'
  end


end
