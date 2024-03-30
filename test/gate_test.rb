require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def gate_test
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)
  
    # 160円の切符を購入する
    ticket = Ticket.new(160)
    # 梅田で入場し、十三で出場する
    umeda.enter(ticket)
    # 期待する結果：出場できる。
    assert juso.exit(ticket)
  end
end
