get '/' do
  @urls = Url.all
  erb :index
end

get '/url/:url_id' do
  @url = Url.find(params[:url_id])
  erb :url
end

get '/:shortened_url' do
  @url = Url.find_by_shortened_url(params[:shortened_url])
  @url.add_click
  redirect to(@url.original)
end

post '/url/create' do
  @url = Url.find_or_create_by_original(params[:url][:original])
  if @url.valid?
    redirect to("/url/#{@url.id}")
  else
    @urls = Url.all
    erb :index
  end
end


