#!/usr/bin/ruby
# Write a function which finds the maximum number in an array or numbers.

$numbers=[]

maxi = 23
for num in 1..maxi
  $numbers.push rand(maxi)
end

def search_array(array)
  max = array[0]
  for iter in 0..(array.length-1)
    if(max < array[iter])
      max = array[iter]
    end
  end
  return max
end


$theMax = search_array($numbers)

print "$numbers= ["
$numbers.each { |i| print i, ", "}
print "] \n"
print "max = " + $theMax.to_s() + "\n"