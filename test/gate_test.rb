require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_umeda_to_juso
    # 160円の切符を購入する
    ticket = Ticket.new(160)
    # 梅田で入場し、十三で出場する
    @umeda.enter(ticket)
    # 期待する結果：出場できる。
    assert @juso.exit(ticket)
  end
  
  def test_umeda_tomikuni_when_fare_is_not_enough  
    # 160円の切符を購入する
    ticket = Ticket.new(160)
    # 梅田で入場し、三国で出場する
    @umeda.enter(ticket)
    # 期待する結果：出場できる。
    refute @mikuni.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_juso_to_mikuni
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
