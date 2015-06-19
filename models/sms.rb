unless $account_sid
	require_relative '../private/keys.rb'
end
require_relative 'kitten.rb'

require 'twilio-ruby'

class MessageLaunch
	attr_reader :kitten_counter

	@@kitten_counter = 0

	def send(message, destination, kitten)
		@client = Twilio::REST::Client.new($account_sid, $auth_token)

		@message = message + "--Sent from https://kitten-send.herokuapp.com/"
		@destination = destination
		@kitten_url = kitten

		@client.account.messages.create({
				:from => '+19314420983',
				:to => @destination,
				:body => @message,
				:media_url => @kitten_url
			})
		
		@@kitten_counter += 1


	end

	def self.kitten_counter
		@@kitten_counter
	end

end
### TEST CODE - successful as of this commit - kitten counter is still broken. 
# a_kitty = Kitten.new.kitty_url
# puts a_kitty
# save = MessageLaunch.new.send("This is in beta - website isn't live yet", "6155006030", a_kitty)
# puts MessageLaunch.kitten_counter
# puts "success!"
