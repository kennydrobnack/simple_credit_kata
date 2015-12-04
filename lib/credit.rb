require 'bigdecimal'

class Credit

	def initialize (start_amount, rate)
		@credits = Array.new
		@first_credit = {
			'start_amount' => BigDecimal(start_amount, 2),
			'rate' => BigDecimal(rate, 2),
			'start_date' => 1
		}
		@credits.push(@first_credit)
	end

	def calculate_interest (amount, rate, start_date, end_date)
		days = end_date - start_date + 1
		return (amount * rate/ 365 * days).round(2)
	end

	def calculate_amount_due (amount, rate, start_date, end_date)
		return amount + calculate_interest(amount, rate, start_date, end_date)
	end
end