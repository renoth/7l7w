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

"\n4. create own average method on List" println


List myAverage := method(if(size < 1,0, sum / size))
list(1,2,5) myAverage println

"\n5. Write a prototype for a 2-dimensional List" println

Matrix := List clone
Matrix dim := method(x,y, Matrix clone setSize(y) map(col, List clone setSize(x)))
Matrix clone dim(3,4) println

# Also return call target for chaining:
Matrix set := method(x,y,val, at(y) atPut(x, val); call target)
Matrix clone dim(3,4) set(0,0,0) set(1,0,8) set(0,1,99) println

Matrix get := method(x,y, at(y) at(x))
Matrix clone dim(3,4) set(0,0,0) set(1,0,8) set(0,1,99) get(1,0) println

"\n6. Write a transpose method for Matrix" println







