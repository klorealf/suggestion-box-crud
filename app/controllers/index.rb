get '/' do
 redirect '/suggestions'
end

get '/suggestions' do
  p session
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  # @user = User.find_by(params[:id])
  # if @user.valid?
  #   redirect '/'
  # else
  #   status 422
  #   @errors = user.errors.full_messages
  #   erb :'suggestions/new'
  # end

  if !logged_in?
    redirect '/suggestions'
  else
    erb :'suggestions/new'
  end
end

post '/suggestions' do
  # binding.pry
  @suggestion = Suggestion.create(params[:suggestion])
  redirect '/'
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id])
  erb :'suggestions/edit'
end

patch '/suggestions/:id' do
  suggestion = Suggestion.find(params[:id])
  suggestion.update(params[:suggestion])
  redirect "/suggestions/#{suggestion.id}"
end

delete '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  @suggestion.destroy
  redirect '/suggestions'
end
