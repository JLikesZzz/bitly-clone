get '/' do
  @uri = Url.all.sort_by {|x| x[:created_at]}.reverse
  erb :"static/index"

end

post '/urls' do

# url1 = Url.shorten

	text = params[:long_url]
	regex = (/\(?(?:(http|https):\/\/)/)
  	
  if text.match(regex)
  		params[:long_url] 
  	else
  		params[:long_url] = "http://" + params[:long_url]
  end

  @uri = Url.all.sort_by {|x| x[:created_at]}.reverse
  	@url = Url.new(long: params[:long_url])
    @url.save
  	if @url.save == true
  		 @url
  	erb :"static/index" 
  	else
  		@url=nil
  		@urll = true
  	erb :"static/index"
  	end

end

get '/list' do
	@uri = Url.all.sort_by {|x| x[:created_at]}.reverse
	erb :"static/index3"
end

get '/delete/:short_url' do
	a = Url.find_by(short: params[:short_url])
	a.destroy
	redirect '/list'
end

get '/:short_url' do
	a = Url.all
	b = a.find_by(short: params[:short_url])
		count = b.counter.to_i
		count += 1
		b.counter = count
		b.save
	redirect b.long
end

