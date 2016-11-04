require './config/environment'
require './app/models/tweet'
require './app/models/user'

class ApplicationController < Sinatra::Base
    use Rack::Session::Cookie

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end
    

    get '/' do
        @tweets = Tweet.all
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        erb :index
    end
    
    post '/login' do
        user = User.find_by(username: params[:username], email: params[:email])
        if user
            session[:user_id] = user.id
            redirect to '/'
        else
            "Incorrect Credentials"
        end
    end
    
    get '/logout' do
        session.delete(:user_id)
        redirect to '/'
    end
    
    get '/tweets/new' do
        @user = User.find(session[:user_id])
        erb :new_tweet
    end
    
    post '/tweets/create'do
        @tweet = Tweet.create(params)
        redirect to '/'
    end
    
    get '/tweets/:id/delete' do 
        @tweet = Tweet.find(params[:id])
        @tweet.delete
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
    
    get '/users/:id/delete' do
        @user = User.find(params[:id])
        @user.tweets.delete_all
        @user.delete
        redirect to '/'
    end

end