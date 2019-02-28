
require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @drawer = CashRegister.new(100)
    @trans1 = Transaction.new(12)
    @trans2 = Transaction.new(25)
    @trans3 = Transaction.new(40)
  end
  
  def test_accept_money
    @trans1.amount_paid = 12
    @drawer.accept_money(@trans1)
    
    assert_equal(@drawer.total_money, 112)
  end
  
  def test_change
    @trans1.amount_paid = 12
    @trans2.amount_paid = 30
    @trans3.amount_paid = 100
    
    assert_equal @drawer.change(@trans1), 0
    assert_equal @drawer.change(@trans2), 5
    assert_equal @drawer.change(@trans3), 60
  end
  
  def test_give_receipt
    assert_output("You've paid $25.\n") do
      @drawer.give_receipt(@trans2)
    end
  end
  
  def test_prompt_for_payment
    input = StringIO.new('40\n')
    output = StringIO.new
    
    @trans3.prompt_for_payment(input: input, output: output)
    assert_equal 40, @trans3.amount_paid
  end
      
end