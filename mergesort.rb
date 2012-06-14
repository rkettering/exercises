#!/usr/bin/ruby

$items=[]

for ss in 1..25
  $items.push rand(25)
end

def mergesort(subarray)
  before = []
  after = []
  #puts subarray.length
  if subarray.length <= 1
    return subarray
  else
    middle = (subarray.length / 2)
    i = 0;
    subarray.each do |x|
      if i < middle
        before.push(x)
      else
        after.push(x)
      end
      i = i + 1
    end
    before = mergesort(before)
    after = mergesort(after)
    return merge(before, after)
  end
end
 
def merge(before, after)
  combined = []
  while before.length > 0 or after.length > 0
    if before.length > 0 and after.length > 0
      if before[0] <= after[0]
        combined.push(before[0])
        before = before[1..-1]
      else
        combined.push(after[0])
        after = after[1..-1]
      end
    elsif before.length > 0
      combined.push(before[0])
      before = before[1..-1]
    elsif after.length > 0
      combined.push(after[0])
      after = after [1..-1]
    end
  end
  
  return combined
  
end
print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

$items2 = mergesort($items)

print "$items2= ["
$items2.each { |i| print i, ", "}
print "] \n"


#Ruby's integer.times looping is one of the coolest syntactic sugars I've seen, heh. You could do
#50.times { $items.push rand(50) }
#well I realized you actually don't need "Enumerable#any?", but for example if you want to check whether any item of an array is equal to 3, array.any? {|item| item == 3}
#so your lines 17-24 which return the subarray if it has all equal elements can be rewritten in these 3 ways: 1. return subarray if subarray.uniq.length == 1  2. return subarray if subarray.all? {|i| i==subarray[0]}  3. return subarray unless subarray.any? {|i| i!=subarray[0]}


#print $items.length
#$items2.each { |i| print i, ", "}