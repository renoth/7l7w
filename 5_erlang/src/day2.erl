-module(day2).

%% API
-export([printExercises/0]).

printExercises() ->
  Store = [{erlang, "a functional lang"}, {ruby, "an OO lang"}],
  io:format("~s~n", [associatedValue(Store, ruby)]),
  List = [{bread, 3, 1}, {coffee, 10, 2}],
  Result = totalPrices(List),
  lists:filter(fun({Item, TotalPrice}) -> io:format("~s~n", [Item]), io:format("~.10B~n", [TotalPrice]), true end, Result).

% write a function that accepts a list and a keyword and returns the associated value

associatedValue(List, Name) ->
  [{Return}] = [{Value} || {_, Value} <- lists:filter(fun({K, _}) -> K == Name end, List)],
  Return.

% write a function that computes the total price per item in a shopping cart

totalPrices(List) ->
  [{Item, Price * Quantity} || {Item, Quantity, Price} <- List].


