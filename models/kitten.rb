unless $account_sid
	require_relative '../private/keys.rb'
end

require 'open-uri'
require 'json'

class Kitten

	def kitty_url
		@json_kitties = open("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{$flickr_auth}&tags=kitten&sort=interestingness-desc&format=json&nojsoncallback=1").read
		@kitty_hash = JSON.parse(@json_kitties)	

		@favorite_kitty = @kitty_hash["photos"]["photo"].sample

		@kitty_id = @favorite_kitty["id"]
		@kitty_farm = @favorite_kitty["farm"]
		@kitty_server = @favorite_kitty["server"]
		@kitty_secret = @favorite_kitty["secret"]

		"https://farm#{@kitty_farm}.static.flickr.com/#{@kitty_server}/#{@kitty_id}_#{@kitty_secret}.jpg"
	
	end

end
