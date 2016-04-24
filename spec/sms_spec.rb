require 'sms'

describe Sms do
	describe '#send' do
		subject(:sms)  { described_class.new(aclient) }
		let(:aclient)  { double(:Client, account: account) }
		let(:account)  { double(:account, messages: messages) }
		let(:messages) { double(:message, create: nil) }
		let(:food)     { double(:food, name: "Chicken", price: 1) }
		let(:order)    { [food] }
		before(:each)  { allow(sms).to receive(:client){aclient} }
		
		it 'calls the external API with a method' do
			allow(sms).to receive(:send) {"Message sent"}
			expect(sms.send("message")).to eq("Message sent")
		end

	    it 'sends the automated text message' do
	      expect(messages).to receive(:create)
	      sms.send(order)
	    end
	end
end