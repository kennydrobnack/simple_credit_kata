require 'bigdecimal'

class Credit

	def initialize (credit_limit, start_amount, rate)
		@credit_limit = BigDecimal(credit_limit, 2)
		@credits = Array.new
		@rate = BigDecimal(rate, 2)
		first_credit = {
			'amount' => BigDecimal(start_amount, 2),
			'start_date' => 1,
			'end_date' => 30 #Assuming this is just a 30 day loan with full balance due at end.
		}
		@credits.push(first_credit)
	end

	def draw_money(amount, date)
		new_credit = {
			'amount' => BigDecimal(amount),
			'start_date' => date,
			'end_date' => 30
		}
	end

	def calculate_remaining_credit
		return @credit_limit - calculate_amount_due
	end

	def calculate_interest
		return @credits.reduce(0){ |total_interest, c| 
			total_interest +  (c['amount'] * @rate / 365 * (c['end_date'] - c['start_date'] + 1)).round(2) }
	end

	def calculate_amount_due
		return @credits.reduce(0) { |total_due, c| total_due + c['amount']} + calculate_interest
	end
end