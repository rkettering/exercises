#!/user/bin/ruby

$items=[]
for num in 1..25
	$items.push rand(25)
end


def swap(array, a, b)
   temp = array[a]
   array[a] = array[b]
   array[b] = temp
end  

def siftdown(array, start, finish)
  root = start
  while root * 2 + 1 <= finish    #while the root has at least one child
    child = root * 2 + 1          #this points to the left child
    swap = root
    if(array[swap] < array[child])  #check if the root is bigger than left child
      swap = child
    end
    if(child + 1 <= finish and array[swap] < array[child + 1])
      swap = child + 1
    end
    if(swap != root)
      swap(array, root, swap)
      root = swap
    else
      return
    end
  end
end

def heapify(array, count)
  start = (count - 2)/2
  while start >= 0
    siftdown(array, start, count-1)
    start = start - 1
  end
end

def heapsort(array, count)
  heapify(array, count)
  
  finish = count-1
  while finish > 0
    swap(array,finish,0)
    finish = finish - 1
    siftdown(array,0,finish)
  end
end

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

heapsort($items,$items.length)

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

