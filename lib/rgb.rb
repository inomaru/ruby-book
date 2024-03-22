def to_hex(r=0, g=0, b=0)
  [r,g,b].sum('#') do |n|
    n.to_s(16).rjust(2, '0')
  end
end