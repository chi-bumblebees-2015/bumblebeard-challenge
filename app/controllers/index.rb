require 'sinatra'

get '/' do
  @repeat = params[:repeat]
  erb :index
end

post '/login' do
  @user = User.find_by(username: params["username"])
  if @user == nil || params["password"] != @user.password
    redirect to('/?repeat=true')
  else
    redirect to('/welcome')
  end
end

get '/invalid_login' do
  erb :invalid_login
end
