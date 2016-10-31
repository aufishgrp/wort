-module(wort_default_formatter).

%%
%% Exported Functions
%%
-export([do_log/10, do_log_unsafe/10]).
-export([format/2, format/3]).

%%
%% API Functions
%%

do_log(Severity, _, Format, Args, _, _, _, _, _, _) when is_atom(Severity) ->
	fun() -> {Format, Args} end.

do_log_unsafe(Severity, _, Format, Args, _, _, _, _, _, _) when is_atom(Severity) ->
	fun() -> {Format, Args} end.

-spec format(lager_msg:lager_msg(),list()) -> any().
format(Msg, Config) ->
    format(Msg, Config, []).

-spec format(lager_msg:lager_msg(),list(),list()) -> any().
format(Msg, Config, Colors) ->
    term_to_binary({Msg, Config, Colors}).        

