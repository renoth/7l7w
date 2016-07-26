-module(day1).

%% API
-export([printExercises/0]).

printExercises() ->
  io:format("~.10B~n", [countWords("This is a test of some sorts.")]),
  io:format("~.10B~n", [count(10)]),
  write_that(success),
  write_that({error, "An error message"}).

% write a function that counts the number of words in a string

countWords(Text) -> countWord(string:tokens(Text, " ")).

countWord([]) -> 0;
countWord([_ | T]) -> countWord(T) + 1.

% write a function that counts to 10 recursively

count(1) -> 1;
count(N) -> count(N - 1) + 1.

% write a function that uses matching to selectively print success or error: message given input of the form {error: Message} or success

write_that(success) -> io:format("success~n", []);
write_that({error, Message}) -> io:format("~s~n", [Message]).
