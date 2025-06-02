.PHONY: dist test build

ifeq ($(OS),Windows_NT)
  ROOT_PWD=$(shell powershell -Command '(Get-Location).Path')
  ENV_GRADLE_WRAPPER_EXEC=.\gradlew.bat
else
  ROOT_PWD=$(shell pwd)
  ENV_GRADLE_WRAPPER_EXEC=./gradlew
endif

include z-android-base.mk
include demo/z-demo.mk
include ndkmodule/z-ndkmodule.mk

.PHONY: dep
dep: demoDependImplementation ndkmoduleDependImplementation

.PHONY: test
test: ndkmoduleTest ndkmoduleJacocoReportDebug demoTest

.PHONY: assemble.debug
assemble.debug: ndkmoduleAssembleDebug demoAssembleDebug

.PHONY: ci.prepare
ci.prepare: env init

.PHONY: ci.debug
ci.debug: env init test assemble.debug

.PHONY: ci
ci: ci.debug

.PHONY: help
help: help-ndkmodule help-demo help.android.base
	@echo ""
	@echo "make dep                          ~> show all depend implementation"
	@echo "make test                         ~> run all test"
	@echo "make ci                           ~> run fast as CI"
	@echo ""
	@echo "more task see Makefile!"