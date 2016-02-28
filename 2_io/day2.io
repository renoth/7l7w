"Day 2 - The Sausage King\n" println

# 1. Fibonacci Sequences

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