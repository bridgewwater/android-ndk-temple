# check env set ANDROID_HOME
checkEnvAndroidHome:
ifndef ANDROID_HOME
	@ echo Environment variable ANDROID_HOME is not set
	exit 1
endif

.PHONY: env
env:
	@echo "======= env start ========"
	@echo "ROOT_PWD          ${ROOT_PWD}"
	@echo "======= env end ========"
	@echo ""
	@$(ROOT_PWD)/gradlew --version

# init this project
.PHONY: init
init: checkEnvAndroidHome
	@$(ROOT_PWD)/gradlew clean buildEnvironment --warning-mode all

.PHONY: clean.root
clean.root:
	$(ROOT_PWD)/gradlew clean

.PHONY: clean.idea
clean.idea:
	$(ROOT_PWD)/gradlew cleanIdea

clean.idea.module:
	$(ROOT_PWD)/gradlew cleanIdeaModule

.PHONY: clean.all
clean.all: clean.root clean.idea
	@echo "clean all done"

.PHONY: adb.crash
adb.crash: checkEnvAndroidHome
	adb shell dumpsys dropbox --print data_app_crash

.PHONY: help.android.base
help.android.base:
	@echo "=> $(ROOT_PWD)/z-android-base.mk : android base task"
	@echo "make env                         ~> show project env"
	@echo "make init                        ~> init this project for check base build error"
	@echo ""
	@echo "make clean.root                  ~> clean root"
	@echo "make clean.idea.module           ~> clean gradle build cache"
	@echo "make clean.idea                  ~> clean IDEA project files"
	@echo "make clean.all                   ~> clean all"
	@echo ""
	@echo "make adb.crash                   ~> show last crash info"
	@echo ""