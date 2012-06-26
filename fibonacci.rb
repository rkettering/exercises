#!/usr/bin/ruby

$numbers=[1,1]

def gen_fib(a,b)
	return a + b
end

def generate_sequence(size)
  for iter in 1..size
    $numbers.push( $numbers[iter-1] + $numbers[iter] )
  end
end

generate_sequence(25)

print "$numbers= ["
$numbers.each { |i| print i, ", "}
print "] \n"
