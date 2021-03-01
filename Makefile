.PHONY: dist test build

ROOT_PWD=$(shell pwd)

include z-android-base.mk
include demo/z-demo.mk
include ndkmodule/z-ndkmodule.mk

help: helpAndroidBase help-ndkmodule help-demo
	@echo "more task see Makefile!"