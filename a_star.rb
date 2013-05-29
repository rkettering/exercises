#!/usr/bin/ruby
# a really naive first attempt at writing a pathfinding algorithm.  Gotta start somewhere.
# this isn't optimized in any way, and takes a long time to run, but barring the possibility of the path being flat-out impossible, it does seem to consistently reach the goal.
# you might need a special "solid block" character to get correct terminal output; sorry if that isn't present on your machine

puts "Calculating path...\n"
$array = []

$dimensions = 30
for y_iter in 1..$dimensions
	row = []
	for x_iter in 1..$dimensions
		row.push( (rand(4) == 3) ? rand(2) : 0)
	end
	$array.push row
end

$startPos = [rand(3),rand(3)]
$endPos = [($dimensions-1)-rand($dimensions),($dimensions-1)-rand($dimensions)]
$array[$startPos[0] ][$startPos[1]] = 2
$array[$endPos[0]   ][$endPos[1]  ] = 2





$open = []
$closed = []

def is_passable?(x,y)
	if( $array[x][y] != 1 )
		true
	else
		false
	end
end
def is_on_map?(x,y)
	if( x >= 0 and x < $dimensions and y >= 0 and y < $dimensions )
		true
	end
end
def is_valid?(x,y)
	if is_on_map?(x,y) and is_passable?(x,y)
		true
	end
end

class Node
	def initialize(x_pos, y_pos)
		@x = x_pos
		@y = y_pos
	end
	def parent
		return @parent || nil
	end
	def setParent(node)
		@parent = node
	end
	def x
		@x
	end
	def y
		@y
	end

#--------------------------- make array comparisons work ---------------------------#
	def hash
		"#{@x}#{@y}".hash
	end
	def eql?(comparee)
		self == comparee
		#(@x == comparee.x) and (@y == comparee.y)
	end
	def ==(comparee)
		self.hash == comparee.hash
	end

#--------------------------- pathfinding ops ---------------------------#
	def heuristic_cost
		def _heuristic(x,y) #manhattan dist to endpoint
			xDist = ($endPos[0] - x).abs
			yDist = ($endPos[1] - y).abs
			return xDist + yDist
		end 

		return _heuristic(@x, @y)
	end
	def gross_cost
		def _gross_cost(val)
			if parent
				return parent._gross_cost(val+1)
			else
				return val
			end
		end

		return _gross_cost(0)
	end
	
	def full_cost
		self.gross_cost + self.heuristic_cost
	end

	def can_add_node_at?(x, y)
		#puts is_valid?(x,y), "#{x} #{y}"
		#puts (not $closed.include?(Node.new( x, y )))
		#puts (not $open.include?(Node.new( x, y )))
		#puts "\n"

		if(	is_valid?(x,y) and
			(not $closed.include?(Node.new( x, y ))) and
			(not $open.include?(Node.new( x, y ))) )
			return true
		end
	end
	
	def add_adjacent_nodes
		if can_add_node_at?(@x-1, @y)
			newOne = Node.new(@x-1, @y)
			newOne.setParent(self)
			$open.push(newOne)
		end
		if can_add_node_at?(@x, @y-1)
			newOne =  Node.new(@x, @y-1)
			newOne.setParent(self)
			$open.push(newOne)
		end
		if can_add_node_at?(@x+1, @y)
			newOne =  Node.new(@x+1, @y)
			newOne.setParent(self)
			$open.push(newOne)
		end
		if can_add_node_at?(@x, @y+1)
			newOne =  Node.new(@x, @y+1)
			newOne.setParent(self)
			$open.push(newOne)
		end
	end
	
	def consider
		$closed.push(self)
		$open.delete(self)
		self.add_adjacent_nodes
	end
end







init = Node.new( $startPos[0], $startPos[1] )
#$closed.push( init )

init.consider
for iter in 0..($dimensions**2 * 2)
	$open = $open.sort{ |a,b| (a.full_cost <=> b.full_cost) }
	if $open.length > 0
		if $array[ $open[0].x][ $open[0].y] == 0
			$array[ $open[0].x][ $open[0].y] = 3
		end
		$open[0].consider
	else
		#dead end
		#puts "oops"
	end
end

#puts $closed.include?(init)
#puts $open
#$open.each { |foo| print "#{foo.x},#{foo.y} = #{foo.full_cost}\n" } 
puts "\n"
#$open = $open.sort{ |a,b| (a.full_cost <=> b.full_cost) }
#$open.each { |foo| print "#{foo.x},#{foo.y} = #{foo.full_cost}\n" } 

puts "#{$closed.length} nodes in 'closed' list"
if $closed.index(Node.new($endPos[0],$endPos[1])) 
	$reversing_course = $closed[ $closed.index(Node.new($endPos[0],$endPos[1])) ]
	until $reversing_course.parent == nil
		if $array[ $reversing_course.x][ $reversing_course.y] != 2
			$array[ $reversing_course.x][ $reversing_course.y] = 4
		end
		$reversing_course = $reversing_course.parent
	end
else
	puts "could not complete path"
end


#puts init.hash
#puts (Node.new( $startPos[0], $startPos[1] )).hash
#puts init.eql?(Node.new( $startPos[0], $startPos[1] ))
#puts $closed.include?(Node.new( $startPos[0], $startPos[1] ))

#puts heuristic_cost( $startPos[0], $startPos[1] )


def print_output()
	#print "$array= \n"
	$array.each { |i| i.each {
					 |j|
					 case j
					 when 4
					 	print "•"
					 when 3
					 	print "x"
					 when 2
					 	print "*"
					 when 1
					 	print "█"
					 when 0
					 	print " "
					 end }
				 print "\n"}
end

print_output