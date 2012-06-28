#!/usr/bin/ruby

$items=[]

for num in 1..25
	$items.push rand(25)
end

def insertionsort(array)
  for iter in 1..(array.length-1)
    moving_num = array[iter]
    hole_addr = iter
    while hole_addr > 0 and array[hole_addr - 1] > moving_num
      array[hole_addr] = array[hole_addr - 1]
      hole_addr = hole_addr - 1
    end
    array[hole_addr] = moving_num
  end
end


print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

insertionsort($items)

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

