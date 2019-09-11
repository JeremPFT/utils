ifdef OS
	EXT=.exe
else
	EXT=
endif

BUILD=gprbuild$(EXT)
CLEAN=gprclean$(EXT)

EXEC=utils-tests-run$(EXT)

all:  run_tests

compil_lib::
	$(BUILD) -j4 -g -gnatef utils_lib.gpr

compil_tests::
	$(BUILD) -j4 -g -gnatef utils_tests.gpr

clean::
	$(CLEAN) utils_lib.gpr
	$(CLEAN) utils_tests.gpr

run_tests: compil_lib compil_tests
	${HOME}/tmp/bin/$(EXEC)

xref::
	gnatxref -a -aIsrc_lib -aIsrc_tests -aOout_lib -aOout_obj src_test/utils-tests-run.adb
