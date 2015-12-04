require 'bigdecimal'

class Credit

	def initialize (credit_limit, start_amount, rate)
		@credit_limit = BigDecimal(credit_limit, 2)
		@updates = Array.new
		@rate = BigDecimal(rate, 2)
		@principal = start_amount
		first_credit = {
			'amount' => BigDecimal(start_amount, 2),
			'start_date' => 0, #Start at day 0 to avoid off-by-one errors
			'end_date' => 30 #Assuming this is just a 30 day loan with full balance due at end.
		}
		@updates.push(first_credit)
	end

	def draw_money(amount, date)
		@updates.last['end_date'] = date
		new_credit = {
			'amount' => BigDecimal((@principal + amount), 2),
			'start_date' => date,
			'end_date' => 30
		}
		@updates.push(new_credit)
		@principal += amount
	end

	def paydown(amount, date)
		@updates.last['end_date'] = date
		new_credit = {
			'amount' => BigDecimal(@principal - amount, 2),
			'start_date' => date,
			'end_date' => 30
		}
		@updates.push(new_credit)
		@principal -= amount
	end

	def calculate_remaining_credit
		return @credit_limit - calculate_amount_due
	end

	def calculate_interest
		return @updates.reduce(0){ |total_interest, u| total_interest +  u['amount'] * @rate / 365 * (u['end_date'] - u['start_date'])}.round(2)
	end

	def calculate_amount_due
		return @principal + calculate_interest
	end
end