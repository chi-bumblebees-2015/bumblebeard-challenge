require 'sinatra'
enable :sessions

get '/' do
  @repeat = params[:repeat]
  @dup_username = params[:duplicate]
  @blank = params[:blank]
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

post '/signup' do
  username = params[:username]
  password = params[:password]
  if username == '' || password == ''
    redirect to("/?blank=true")
  elsif User.find_by(username: username) == nil
    session[:user] = User.create!(username: username, password: password)
    redirect to('/welcome')
  else
    redirect to("/?duplicate=#{username}")
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

post '/add_contact' do
  if session[:user]
    @user = session[:user]
    @contact = User.find_by(username: params[:contact_username])
    if @contact && !@user.contacts.index(@contact)
      @user.contacts << @contact
      @user.contacts.uniq!
      redirect to('/welcome')
    else
      redirect to("/welcome")
    end
  else
    redirect to('/')
  end
end

post '/delete_contact' do
  if session[:user]
    @user = session[:user]
    @contact = User.find_by(id: params[:contact_user_id])
    if @contact && @user.contacts.index(@contact)
      @user.contacts.delete(@contact)
      redirect to("/welcome")
    else
      redirect to("/welcome")
    end
  else
    redirect to('/')
  end
end

get '/logout' do
  session[:user] = nil
  erb :logout
end
