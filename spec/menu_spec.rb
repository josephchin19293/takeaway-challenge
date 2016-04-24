require 'menu'
describe Menu do
	
	context 'default empty menu' do
		let(:chicken) {double("food", name: "Chicken", price: 1)}
		describe '#dishes' do
			it 'list is empty by default' do
				expect(subject.dishes).to be_empty
			end
		end
		describe '#remove' do
			let(:no_food_error) {"No such food on the menu."}
			it 'cant remove things from an empty menu' do
				expect{subject.remove(chicken)}.to raise_error(no_food_error)
			end
		end
	end

	context 'dish added' do
		let(:chicken) {double("food", name: "Chicken", price: 1)}
		before(:each) { subject.add(chicken) }
		describe '#dishes' do
			it 'the list should include the added dish' do
				expect(subject.dishes).to eq([chicken])
			end
		end

		describe '#remove' do
			it 'should remove a given dish by name' do
				expect(subject.remove(chicken)).to eq([])
			end
		end
	end
end