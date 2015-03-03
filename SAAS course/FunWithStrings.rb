module FunWithStrings
  def palindrome?
    k = self.split(/[^a-zA-Z]/).reject{|e| e.empty?}
    k = k.join()
    return k.downcase == k.reverse.downcase
  end
  def count_words
    j = self.downcase.split(/[^a-zA-Z]/).reject{|e| e.empty?}
    j.sort!
    k = Hash.new(0)
    j.each do |x|
  	k[x] +=1
    end
    return k  
  end

  def anagram_groups
    if self.length == 0
       return []
    end
    j = self.split(" ")
    if j.length == 1
       x = Array.new
       x.push(j)
    end
    k = j
    arr = Array.new
    k.each do |x|
       i = 0
       k.each do |y|
          if x != y
             a = x.split("")
             b = y.split("")
             if a.sort == b.sort
                arr.push([x, y])
                k.delete(x)
                k.delete(y)
                i =0
             else
                i =2
             end
          end
       end
       if i == 2
          arr.push([x])
       end
    end
    return arr
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end











