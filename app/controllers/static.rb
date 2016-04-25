<<<<<<< HEAD
=======

require 'byebug'

>>>>>>> test2
get '/' do
  @uri = Url.all.order(created_at: :desc).limit(10)
  erb :"static/index"
end

post '/urls' do
	text = params[:long_url]
	regex = (/\(?(?:(http|https):\/\/)/)
  	
  if text.match(regex)
  		params[:long_url] 
  	else
  		params[:long_url] = "http://" + params[:long_url]
  end

  url1 = Url.shorten
  @url = Url.new(long: params[:long_url], short: url1, counter: 0)
  
  if @url.save 
    @url.to_json
  else
  	status 400
  end

end

get '/list' do
	@uri = Url.all.order(created_at: :desc).limit(10)
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
		b.update(counter: count)
	redirect b.long
end

