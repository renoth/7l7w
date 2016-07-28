-module(day3translator).
-behavior(supervisor).
-export([server/0]).

server() ->
  receive
    "casa" ->
      io:format("house~n"),
      loop();

    "blanca" ->
      io:format( "white~n"),
      loop();

    _ ->
      io:format("I don't understand.~n"),
      loop()
  end.


