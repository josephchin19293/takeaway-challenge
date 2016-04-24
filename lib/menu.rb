class Menu
	NO_FOOD_ERROR = "No such food on the menu."
	def initialize
		@dishes = []
	end

	def dishes
		@dishes.dup
	end

	def add(dish)
		@dishes << dish
	end

	def remove(dish)
		fail NO_FOOD_ERROR unless menu_contains?(dish)
		@dishes.delete(dish)
		@dishes
	end

	private

	def menu_contains?(dish)
		@dishes.include?(dish)
	end
end