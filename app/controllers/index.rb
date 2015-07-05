require 'sinatra'
enable :sessions

get '/' do
  @repeat = params[:repeat]
  erb :index
end

post '/login' do
  @user = User.find_by(username: params["username"])
  if @user == nil || params["password"] != @user.password
    redirect to('/?repeat=true')
  else
    session[:user] = @user
    redirect to("/welcome")
  end
end

get '/welcome' do
  if session[:user]
    @user = session[:user]
    # @messages = Message.order(created_at: :asc)
    @messages = @user.received_messages
    erb :welcome
  else
    redirect to('/')
  end
end

post '/form' do
  if session[:user]
    @user = session[:user]
    Message.create!(text: params[:message], sender: @user, recipients: User.all )
    redirect to("/welcome")
  else
    erb :temp
  end
end

post '/logout' do
  session[:user] = nil
  erb :logout
end