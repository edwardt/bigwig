# See LICENSE for licensing information.

DIALYZER = dialyzer
REBAR = ./rebar -vvv

all: app

app:
	@$(REBAR) get-deps
	@$(REBAR) compile

get-deps:
	@$(REBAR) get-deps

clean:
	@$(REBAR) clean
	rm -f erl_crash.dump

tests: clean app eunit ct

eunit:
	@$(REBAR) eunit

ct:
	@$(REBAR) ct

build-plt:
	@$(DIALYZER) --build_plt --output_plt .bigwig_dialyzer.plt \
		--apps kernel stdlib sasl inets crypto public_key ssl

dialyze:
	@$(DIALYZER) --src src --plt .bigwig_dialyzer.plt \
		-Wbehaviours -Werror_handling \
		-Wrace_conditions -Wunmatched_returns # -Wunderspecs
