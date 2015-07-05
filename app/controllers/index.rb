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
    @messages = @user.messages_for_display 
    erb :welcome
  else
    redirect to('/')
  end
end

post '/personal' do
  if session[:user]
    @user = session[:user]
    Message.create!(text: params[:message], sender: @user, recipients: [User.find_by(id: params[:recipient])])
    redirect to("/welcome")
  else
    redirect to('/')
  end
end

post '/group' do
  if session[:user]
    @user = session[:user]
    @group = Group.find_by(id: params[:group])
    Message.create!(text: params[:message], sender: @user, recipients: @group.users, group: @group)
    redirect to("/welcome")
  else
    redirect to('/')
  end
end

post '/logout' do
  session[:user] = nil
  erb :logout
end