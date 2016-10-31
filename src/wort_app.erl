%%%-------------------------------------------------------------------
%% @doc wort public API
%% @end
%%%-------------------------------------------------------------------

-module(wort_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    SinkConfig = [
		{handlers, [
			{wort_file_backend, [
				{formatter, wort_default_formatter},
				{file, application:get_env(wort, file, "raw.log")},
				{level, application:get_env(wort, level, info)}
			]}
		]},
		{async_threshold, application:get_env(wort, async_threshold, 500)},
		{async_threshold_window, application:get_env(wort, async_threshold_window, 50)}
    ],

    lager_app:configure_sink(wort_lager_event, SinkConfig),
    wort_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
