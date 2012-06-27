#!/user/bin/ruby

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
  swapped_this_iteration = true
  while swapped_this_iteration == true
    swapped_this_iteration = false
    for x in 1..(array.length-1)
      if array[x-1] > array[x]
        swap(array, x-1, x)
        swapped_this_iteration = true
      end
    end
  end
end

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

bubblesort($items)

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

