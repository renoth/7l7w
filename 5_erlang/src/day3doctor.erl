-module(day3doctor).
-export([loop/0, printExercises/0, server/0]).

server() ->
  receive
    "casa" ->
      io:format("house~n"),
      server();

    "blanca" ->
      io:format( "white~n"),
      server();

    _ ->
      io:format("I don't understand.~n"),
      server()
  end.

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("New Translator!~n"),
      register(translator, spawn_link(fun day3doctor:server/0)),
      loop();
    {'EXIT', From, Reason} ->
      case Reason of
        translator ->
          io:format("The translator died: restart translator ~n"),
          self() ! new,
          loop();
        day3doctor ->
          io:format("The doctor died, restarting doctor. ~n"),
          exit(whereis(translator), translator),
          Doctor = spawn(fun doctor:loop/0),
          Doctor ! new
      end
  end.

printExercises() ->
  Doctor = spawn(fun day3doctor:loop/0),
  Doctor ! new,
  io:format("~p~n", [whereis(translator)]),
  exit(Doctor, day3doctor).