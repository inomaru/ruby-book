require 'debug'

class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [160, 190]
  def initialize(name)
    @name = name
  end

  def enter(ticket)
    # 乗車駅のスタンプを押す
    ticket.stamp(@name)
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    # 配列はゼロオリジンなので-1する
    FARES[distance - 1]
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    # binding.break
    fare <= ticket.fare
  end
end