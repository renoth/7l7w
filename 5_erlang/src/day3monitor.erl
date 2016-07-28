-module(day3monitor).
-behavior(supervisor).
-export([start_link/0, init/0]).

start_link() ->
  supervisor:start_link(day3monitor, []).

% documenatation ad http://erlang.org/doc/design_principles/sup_princ.html

init() ->
  SupFlags = #{strategy => one_for_one, intensity => 1, period => 5},
  ChildSpecs = [#{id => day3client,
    start => {day3client, start_link, []},
    restart => permanent,
    shutdown => brutal_kill,
    type => worker,
    modules => [cg3]}],
  {ok, {SupFlags, ChildSpecs}}.
