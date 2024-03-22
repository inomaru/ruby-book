def to_hex(r=0, g=0, b=0)
  [r,g,b].sum('#') do |n|
    n.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r,g,b].map do |s|
    s.hex
  end
end