require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end


    get '/tweets' do
        @tweets = Tweet.all
        erb :index
    end
    
    post '/tweets'do
        @tweet = Tweet.new(params)
        @tweet.save
        redirect to '/tweets'
    end

end