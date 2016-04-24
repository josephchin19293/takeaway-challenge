require 'food'

describe Food do
	subject(:food) {Food.new("Chicken", 2)}
	describe '#initialize' do 
		it 'is initialized with a name' do
			expect(food.name).to eq "Chicken"
		end

		it 'is initialized with a value' do
			expect(food.price).to eq 2
		end
	end
end