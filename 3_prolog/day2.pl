% Exercise 1: Reverse a List
% Usage: reverse([a,b,c],[],Reverse).

reverse([Head|Tail], Accumulator, Reverse) :- reverse(Tail,[Head|Accumulator],Reverse).
reverse([],Accumulator,Accumulator).

% Exercise 2: Find the smallest Element in a List

minimumList([Element], Element).
minimumList([Head|Tail],Min) :- minimumList(Tail, MinimumTail), Minimum is minimum (Head,MinimumTail).
