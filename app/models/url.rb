

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

validates :long, :format => {:with => /\(?(?:(http|https):\/\/)(?:((?:[^\W\s]|\.|-|[:]{1})+)@{1})?((?:www.)?(?:[^\W\s]|\.|-)+[\.][^\W\s]{2,4}|localhost(?=\/)|\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})(?::(\d*))?([\/]?[^\s\?]*[\/]{1})*(?:\/?([^\s\n\?\[\]\{\}\#]*(?:(?=\.)){1}|[^\s\n\?\[\]\{\}\.\#]*)?([\.]{1}[^\s\?\#]*)?)?(?:\?{1}([^\s\n\#\[\]]*))?([\#][^\s\n]*)?\)?/}
validates :short, :uniqueness => true


# before_create :shorten

	def self.shorten
		
			letters_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
			random_selection = letters_array.sample(6)
			new_url = random_selection.join('')
			new_url
		
	end




end
