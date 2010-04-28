# abst = "Measured By western Blotting. Western blot is hoge (Western blotting is spam). This is eastern hat."
# thern = ["northern","Northern","southern","Southern","eastern","Eastern","western","Western"]
# h={ }
# id="1"

def choice(abst,word,h,id)
  a = abst.split("\s")
  word.each do |key|
    ret = []
    a.each_with_index{|v,i|ret << i if /#{key}/ =~ v}
    ret.each do |n|
      match = a[n]
      before = a[n-1]
      after  = a[n+1]
      if /blot/i =~ after
        if before[before.length - 1] == 46  #before = . 
          h[id => match] = 1
        elsif match[0] == 40 #match has (...
          c = key.length
          d = match.length
          h[id => match[d-c,c]] = 1
        else
          h[id => match] = 1
        end
      end
    end
  end
end


# choice(abst,thern,h,id)
# p h
