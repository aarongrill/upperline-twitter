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
    
    get '/tweets/new' do
        @users = User.all
        erb :new_tweet
    end
    
    post '/tweets/create'do
        @tweet = Tweet.create(params)
        redirect to '/'
    end
    
    get '/tweets/:id' do
        @tweet = Tweet.find(params[:id])
        erb :show_tweet
    end
    
    get '/users/new' do
        erb :new_user
    end
    
    post '/user/create'do
        @user = User.create(params)
        redirect to '/'
    end
    
    get '/users' do
        @users = User.all
        erb :show_users
    end
    
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :show_user
    end

end