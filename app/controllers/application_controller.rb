require './config/environment'
require './app/models/tweet'
require './app/models/user'

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
        @users = User.all
        erb :tweet
    end
    
    post '/tweets'do
        @tweet = Tweet.create(params)
        redirect to '/'
    end
    
    get '/user' do
        erb :user
    end
    
    post '/user'do
        @user = User.create(params)
        redirect to '/'
    end

end