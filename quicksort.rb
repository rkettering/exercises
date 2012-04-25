#!/usr/bin/ruby

$items=[]

for ss in 1..250000
  $items.push rand(250000)
end

def quicksort(subarray)
  less = []
  greater = []
  #puts subarray.length
  if subarray.length < 1
    return subarray
  else
    equal=true
    subarray.each do |x|
      if x != subarray[0]
        equal=false
      end
    end
    if equal == true
      return subarray
    end
  end
  
  pivot = rand(subarray.length)
  subarray.each do |x|
    if x<= subarray[pivot-1]
      less.push(x)
    else
      greater.push(x)
    end
  end
  #print "ITERATION.  Pivot=", subarray[pivot-1], "\n"
  #print "less= ["
  #less.each {|i| print i,", "}
  #print "] \n"
  #print "greater= ["
  #greater.each {|i| print i,", "}
  #print "] \n"
  return quicksort(less) + quicksort(greater)
  
end
print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

$items2 = quicksort($items)

print "$items2= ["
$items2.each { |i| print i, ", "}
print "] \n"


#Ruby's integer.times looping is one of the coolest syntactic sugars I've seen, heh. You could do
#50.times { $items.push rand(50) }
#well I realized you actually don't need "Enumerable#any?", but for example if you want to check whether any item of an array is equal to 3, array.any? {|item| item == 3}
#so your lines 17-24 which return the subarray if it has all equal elements can be rewritten in these 3 ways: 1. return subarray if subarray.uniq.length == 1  2. return subarray if subarray.all? {|i| i==subarray[0]}  3. return subarray unless subarray.any? {|i| i!=subarray[0]}


#print $items.length
#$items2.each { |i| print i, ", "}