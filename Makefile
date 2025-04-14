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

.PHONY: ci.debug
ci.debug: init ndkmoduleTest ndkmoduleJacocoReportDebug ndkmoduleAssembleDebug demoTest demoAssembleDebug

.PHONY: ci
ci: ci.debug

.PHONY: help
help: help-ndkmodule help-demo help.android.base
	@echo "more task see Makefile!"