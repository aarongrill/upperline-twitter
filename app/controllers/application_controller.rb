require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end


    get '/' do
        @tweets = Tweet.all
        erb :index
    end
    
    get '/tweet' do
        erb :tweet
    end
    
    post '/tweets'do
        @tweet = Tweet.create(params)
        redirect to '/'
    end

end