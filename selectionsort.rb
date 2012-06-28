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

def selectionsort(array)
  for jter in 0 .. (array.length - 1)
    iMin = jter
    for iter in (jter + 1) .. (array.length - 1)
      if(array[iter] < array[iMin])
        iMin = iter
      end
    end
    if(iMin != jter)
      swap(array,jter,iMin)
    end
  end
end

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

selectionsort($items)

print "$items= ["
$items.each { |i| print i, ", "}
print "] \n"

