#!/usr/bin/ruby
# Write a function which reverses the contents of an array in place.

$numbers=[]

for num in 1..23
  $numbers.push num
end

def flip_array(array)
  for iter in 0..((array.length-1)/2)
      flip = array[array.length-1-iter]
      array[array.length-1-iter] = array[iter]
      array[iter] = flip
  end
end


flip_array($numbers)

print "$numbers= ["
$numbers.each { |i| print i, ", "}
print "] \n"
