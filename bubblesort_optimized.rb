#!/usr/bin/ruby

$items=[]

def swap(array, a, b)
   temp = array[a]
   array[a] = array[b]
   array[b] = temp
end  
#swap($items,0,1)

#print $items



for ss in 1..25
  $items.push rand(25)
end

def bubblesort(array)
  iter = array.length
  while iter > 0
    new_iter = 0
    for x in 1..(iter-1)
      if array[x-1] > array[x]
        swap(array, x-1, x)
        new_iter = x
      end
    end
    iter = new_iter
  end
end

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

bubblesort($items)

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

