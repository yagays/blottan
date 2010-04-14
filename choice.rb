abst = "Measured By western Blotting. Western blot is hoge (western blottin is spam)"

#abst = string(abstract) , thern = e.g. "western", "eastern" etc...
def choice(abst,thern) 
  ret = []
  a = abst.split("\s")
  a.each_with_index{|v,i|ret << i if /#{thern}/ =~ v}

  ret.each do |n|
    match = a[n]
    before = a[n-1]
    puts match
#     if before[before.length - 1] == 46 or match[0] == 40
#       h[id => #{hoge}] = 1
#     elsif
#       h[id => ] = 1
#     end
  end
end



thern = "western"
choice(abst,thern)
#p abst.split("\s")[n-1..n+1]
