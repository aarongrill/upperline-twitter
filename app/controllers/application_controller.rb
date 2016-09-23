require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end


    get '/' do
        @tweet1 = Tweet.new("upperlinecode", "We <3 Coding")
        @tweet2 = Tweet.new("upperlinecode", "Upperline == Awesome")
        @tweet3 = Tweet.new("upperlinecode", "Our students can build Twitter, can yours?")
        @tweet4 = Tweet.new("flatironschool", "#outsidethelines")
        @tweet5 = Tweet.new("flatironschool", "Developers Developers Developers!")
        @tweets = Tweet.all
        erb :index
    end

end