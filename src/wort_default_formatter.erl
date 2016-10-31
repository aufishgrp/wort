-module(wort_default_formatter).

%%
%% Exported Functions
%%
-export([format/2, format/3]).

%%
%% API Functions
%%
-spec format(lager_msg:lager_msg(),list()) -> any().
format(Msg, Config) ->
    format(Msg, Config, []).

-spec format(lager_msg:lager_msg(),list(),list()) -> any().
format(Msg, Config, Colors) ->
    io:format("Format\n~p\n~p\n~p\n", [Msg, Config, Colors]),
    term_to_binary({Msg, Config, Colors}).        

