require 'twilio-ruby'

account_sid = 'ACdc6f190bbd342feb98a4ee1e686b3ba1'
auth_token = '36f535bc5d3e87158d90a35eff4e5bb0'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
	:from => '+441277424415',
	:to => '+447447807893',
	:body => 'CONGRATULATIONS BITCH, YOU GOT TWILIO WORKING',
})