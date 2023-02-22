# Using a hash table, print the frequency of occurrence of each character inside an array.
# i=10
# a = []
# while i>0
#     num = gets.chomp
#     a.push(num)
#     i-=1
# end
a = ["a","r","c","h","i","t","a","a","r","a","k","k","a"]

a_count = Hash.new(0)
a.each {|a| a_count[a] += 1}
a_count.sort_by {|a, number| number}.last[0]

puts "#{a_count}"

# a = a.count("a")
# puts "#{a}" 