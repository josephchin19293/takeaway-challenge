require 'order'

describe Order do
	# Subjects
	subject(:order)      {described_class.new(menu)}
	# Doubles
	let(:menu)          {double("menu", dishes: [chicken])}
	let(:chicken)       {double("food", name: "Chicken", price: 1)}
	# Method calls
	let(:add_chicken)   {order.add(chicken)}
	let(:add_fish)      {order.add("Fish")}
	# Errors
	let(:no_food_error) {"That item is not on the menu."}

	describe '#initialize' do
		it 'has an empty basket by default' do
			expect(order.check).to eq("Total: $0")
		end

		it 'has a basket total of 0 by default' do
			expect(order.check).to eq("Total: $0")
		end 
	end
	
	describe '#list_dishes' do
		it 'lists the dishes for the customer to see' do
			expect(order.list_dishes).to eq menu.dishes
		end 
	end

	describe '#add(food)' do
		
		it 'adds an item to the customers basket' do
			expect{add_chicken}.to change{order.basket}
		end

		it 'only adds an item if it is on the menu' do
			expect{add_fish}.to raise_error(no_food_error)
		end
	end

	describe '#remove' do
		before(:each) {order.add(chicken)}
		before(:each) {order.add(chicken)}
		it 'removes the desired item from the order' do
			expect{order.remove(chicken)}.to change{order.check}
		end

		it 'only removes the item once from the list' do
			order.remove(chicken)
			expect(order.basket).to eq([chicken])
		end
	end

	describe '#check' do
		before(:each) { add_chicken }
		it 'shows the items in the basket' do
			expect(order.check).to include("Chicken")
		end

		it 'shows the prices of the basket' do
			expect(order.check).to include("$1")
		end

		it 'shows the total price of the basket' do
			order.add(chicken)
			expect(order.check).to include("Total: $2")
		end
	end

	context 'placing order' do
		let(:order1)         { described_class.new(menu,message_double) }
		let(:message_double) { double("messageclass", new: message) }
		let(:message)        { double("message", send: true) }
		before(:each)        { order1.add(chicken) }
		before(:each)        { order1.place }
		it 'clears all instance variables in prep for next order' do
			expect(order1.check).to eq("Total: $0")
		end
	end
end