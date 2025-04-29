ANTLR_PARSE:=antlr4-parse
ANTLR_FLAGS:=-trace
MAKEFLAGS+=--no-print-directory

GRAMMAR:=HyneqLang.g4
START_RULE:=program
PROGRAMS:=programs
VALIDATION:=validation

.PHONY: clean $(VALIDATION)/valid $(VALIDATION)/invalid

$(VALIDATION)/%.out: $(PROGRAMS)/%.hy
	@mkdir -p "$(@D)"
	$(ANTLR_PARSE) "$(GRAMMAR)" "$(START_RULE)" $(ANTLR_FLAGS) "$<" 2>&1 | tee "$@"

clean:
	rm -rf validation/

$(VALIDATION)/valid:
	@make $@/HelloWorldSimple.out
	@make $@/HelloWorld.out
	@make $@/HelloWorldMultilang.out

$(VALIDATION)/invalid:
	@make $@/HelloWorld_NoComma.out
	@make $@/HelloWorld_NoBrackets.out
	@make $@/HelloWorld_WrongBraces.out
	@make $@/HelloWorldMultilang_WrongBraces.out
	@make $@/HelloWorldMultilang_WrongKeywords.out

validation: $(VALIDATION)/valid $(VALIDATION)/invalid
