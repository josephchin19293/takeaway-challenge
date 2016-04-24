require_relative 'menu'
require_relative 'sms'
require_relative 'food'

class Order
	attr_reader :basket
	NO_FOOD_ERROR = "That item is not on the menu."
	def initialize(menu = Menu.new, message_class=Sms)
		@menu = menu
		@basket = []
		@basket_total = 0
		@basket_description = ""
		@sms_class = message_class
	end

	def list_dishes
		@menu.dishes
	end

	def add(food)
		fail NO_FOOD_ERROR unless on_menu?(food)
		reset
		@basket << food
	end

	def remove(food)
		@basket.delete_at(@basket.find_index(food))
	end

	def check
		format_basket_description
		@basket_description
	end

	def place
		sms_factory_send(@basket)
		hard_reset
	end

	private

	def sms_factory_send(order)
		@sms_class.new.send(order)
	end

	def reset
		@basket_total = 0
		@basket_description = ""
	end


	def hard_reset
		@basket = []
		@basket_total = 0
		@basket_description = ""
	end

	def format_basket_description
		reset
		if @basket.any?
			@basket.each{ |food| @basket_description += "#{food.name}: $#{food.price}; " }
		end
		total
	end

	def total
		@basket.each do |food|
			@basket_total += food.price
		end
		@basket_description += "Total: $#{@basket_total}"
	end

	def on_menu?(food)
		@menu.dishes.include?(food)
	end
end