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

  it 'Calculates interest on multipart 30 day loan' do
    expect(@credit.calculate_interest).to eq (11.99)
  end
  it 'Calculates payment due on multipart 30 day loan' do
    expect(@credit.calculate_amount_due).to eq(411.99)
  end

  it 'Calculates interest on multipart 30 day loan' do
    expect(@credit.calculate_remaining_credit).to eq(588.01)
  end
end