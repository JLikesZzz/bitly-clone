require 'csv'
require_relative '../config/environments/init'
require 'benchmark'

def url_pair
#reads stuff inside the urls file
url_list = CSV.read('urls.csv')
@final_array=[]

url_list.each_with_index do |x, index|
	
	edit_string = x[0].chop
	edit_string[0] = ''

#creates a shorten link
	letters_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
	random_selection = letters_array.sample(6)
	new_url = random_selection.join('')
#puts both the long url from the urls file and the created short
#url together into a string
	time = DateTime.now
temp = %Q[('#{edit_string}', '#{new_url}', '#{time}', '#{time}')]
#push each string into the array
@final_array << temp

puts "Loading...No #{index + 1} of #{url_list.size}"
end
#join each element in the array so it becomes a string with
#single quotation
@final_array.join(", ")
		
end
#here runs the sql
def seed_db
sql = 'INSERT INTO urls ("long", "short", "created_at", "updated_at") VALUES ' + url_pair

Url.connection.execute sql
end

puts Benchmark.measure {seed_db}