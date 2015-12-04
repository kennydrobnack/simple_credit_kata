require 'rspec'
require 'credit'

RSpec.describe Credit do

  before(:each) do
  	@credit_limit = 1000
  	@initial_loan = 500
    @time_period = 30
    @rate = 0.35
    @credit = Credit.new(@credit_limit, @initial_loan, @rate)
end

  it 'Calculates interest on simple 30 day loan' do
    expect(@credit.calculate_interest).to eq(14.38)
  end
  it 'Calculates payment due on simple 30 day loan' do
    expect(@credit.calculate_amount_due).to eq (514.38)
  end

  it 'Calculates interest on simple 30 day loan' do
    expect(@credit.calculate_remaining_credit).to eq(485.62)
  end
end