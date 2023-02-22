# Join 2 arrays without using inbuilt functions.

a = [1,2,3,4,5]
b = [2,4,6,8,10]
c = Array.new(a.size+b.size)

count = 0
count1 = 0

while count < c.length
    if count < a.length
        c[count] = a[count]
    else
        c[count] = b[count1]
        count1 += 1
    end
    count += 1
end

i=0
while (i<10)
    print c[i]," "
    i += 1
    # puts c[i]
end
