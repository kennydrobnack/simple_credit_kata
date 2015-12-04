require 'rspec'
require 'credit'

RSpec.describe Credit do
  it 'Calculate simple interest $500 for 30 days' do
    initial_loan = 500
    time_period = 30
    rate = 0.35
    credit = Credit.new(initial_loan, rate)

    expect(credit.calculate_interest(initial_loan, rate, 1, 30)).to eq(14.38)
    expect(credit.calculate_amount_due(initial_loan, rate, 1, 30)).to eq (514.38)
    #expect(credit.caculate_remaining_credit).to eq(485.62)
  end

  #it 'Correct balance due for 30 day complicated scenario' do
 # 	expect(credit.calculate_interest).to eq (11.99)
  #	expect(credit.calculate_amount_due).to eq(411.99)
  #	expect(credit.remaining_credit).to eq(588.01)
  #nd

end