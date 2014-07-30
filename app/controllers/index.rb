get '/' do
	@derps = Derp.all
	erb :index
end

get '/columns' do
	erb :columns
end

post '/' do
	if request.xhr?
		@derp = Derp.create(text: params[:derp])

		content_type :html
		erb :_derp_text, layout: false, locals: {derp: @derp}
	else
		redirect '/'
	end
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user.password == params[:password]
		# user.authenticate(params[:password])
		session[:user_id] = user.id
		content_type :html
		erb :_logout_form, layout: false
	end
end

post '/logout' do
	session.clear
	erb :_user_forms, layout: false
end

post '/signup' do
	user = User.new(email: params[:email], password: params[:password])
	if user.save
		session[:user_id] = user.id
		content_type :html
		erb :_logout_form, layout: false
	end
end
