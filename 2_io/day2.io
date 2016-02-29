"Day 2 - The Sausage King\n" println

"1. Fibonacci Sequences" println

# recursive
FibRec := Object clone
FibRec nth := method(n, if(n > 2, nth(n-1) + nth(n-2), 1))

i := 1

# iterative
FibIter := Object clone
FibIter nth := method(n,
    fib0 := 1
    fib1 := 1
    fib2 := 1
    j := 1
    for (i,1,n - 2, fib0 = fib1; fib1 = fib2; fib2 = fib0 + fib1; j=j+1)
    fib2
)

while (i <= 10, FibRec nth(i) print; " " print; FibIter nth(i) println; i = i + 1)

"\n2. Change division by zero to return 0" println

standardDivision := Number getSlot("/")
Number / = method(divisor, if(divisor == 0, 0, standardDivision(divisor)))

(66 / 0) println
(66 / 11) println
"\n3. Sum of all Numbers in a 2-dimensional Array" println

# create a matrix
matrix := list(list(1, 2, 3, 4, 5), list(2, 4, 6, 8, 10), list(3, 6, 9, 12, 15), list(4, 8, 12, 16, 20))

List add2 := method(
    sum := 0
    foreach(list, sum = sum + (list sum))
)

matrix add2 println

