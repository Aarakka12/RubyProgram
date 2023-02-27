# Using a hash table, print the frequency of occurrence of each character inside an array.

a = ["a","r","c","h","i","t","a","a","r","a","k","k","a"]

a_count = Hash.new(0)
a.each {|a| a_count[a] += 1}
