# Use the map function to double all the elements in the array. However, handle edge cases (like array can have a character) as well.

a = [1,"a",2.3,3]
print a.map{|i| i.is_a?(Numeric)? i*2:i}," "
