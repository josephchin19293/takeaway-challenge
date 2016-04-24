require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Sms
	def initialize(client = (Twilio::REST::Client.new ENV['SID'], ENV['AUTH']))
		@client = client
	end		

	def send(order)
		@client.account.messages.create({
		:from => '+441277424415',
		:to => ENV['MY_NUM'],
		:body => "#{format_message(order)}",
		})
	end

	private


	def delivery_time
		"Will be delivered by #{(Time.new + 3600).strftime('%I:%M%p')}\n"
	end

	def format_message(order)
		message = "Your order of:\n"
		order.each { |food| message << "1 x #{food.name}\n"}
		message << delivery_time
		message << "Thank you!"
	end

end