.PHONY: dist test build

ifeq ($(OS),Windows_NT)
ROOT_PWD=$(shell powershell -Command '(Get-Location).Path')
else
ROOT_PWD=$(shell pwd)
endif

include z-android-base.mk
include demo/z-demo.mk
include ndkmodule/z-ndkmodule.mk

.PHONY: help
help: help-ndkmodule help-demo help.android.base
	@echo "more task see Makefile!"