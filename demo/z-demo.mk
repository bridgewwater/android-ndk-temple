# change name of com.android.application
ROOT_APP_NAME_demo := demo
ROOT_APP_PACKAGE_demo := com.sinlov.android.ndkmodule.demo
ROOT_APP_LAUNCHER_ACTIVITY_demo := com.sinlov.android.ndkmodule.demo.MainActivity
ROOT_APP_LANCHER_PARAMS_demo :="-a android.intent.action.MAIN -c android.intent.category.LAUNCHER"

.PHONY: demoClean
demoClean:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):clean

.PHONY: demoDependImplementation
demoDependImplementation:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):dependencies --configuration implementation

.PHONY: demoDependReleaseCompileClasspath
demoDependReleaseCompileClasspath:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):dependencies --configuration releaseCompileClasspath

.PHONY: demoTest
demoTest:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):test

.PHONY: demoDebug
demoDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):buildDebug

.PHONY: demoRelease
demoRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):buildRelease

.PHONY: demoAssembleDebug
demoAssembleDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):assembleDebug

.PHONY: demoAssembleRelease
demoAssembleRelease: demoRelease
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):assembleRelease

.PHONY: demoInstallDebug
demoInstallDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):installDebug

.PHONY: demoLaunch
demoLaunch:
	@adb shell am start -n ${ROOT_APP_PACKAGE_demo}/${ROOT_APP_LAUNCHER_ACTIVITY_demo} ${ROOT_APP_LANCHER_PARAMS_demo}

.PHONY: demoLaunchDebug
demoLaunchDebug: demoInstallDebug demoLaunch
	@echo "has launch ${ROOT_PWD}/${ROOT_APP_NAME_demo} as: ${ROOT_APP_PACKAGE_demo}/${ROOT_APP_LAUNCHER_ACTIVITY_demo}"

.PHONY: demoInstallRelease
demoInstallRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):installRelease

.PHONY: demoLaunchRelease
demoLaunchRelease: demoInstallRelease demoLaunch
	@echo "has launch ${ROOT_PWD}/${ROOT_APP_NAME_demo} as: ${ROOT_APP_PACKAGE_demo}/${ROOT_APP_LAUNCHER_ACTIVITY_demo}"

.PHONY: demoUninstallAll
demoUninstallAll:
	$(ROOT_PWD)/gradlew -q $(ROOT_APP_NAME_demo):uninstallAll

.PHONY: help-demo
help-demo:
	@echo "=> ${ROOT_PWD}/${ROOT_APP_NAME_demo}/z-demo.mk : android application module [ ${ROOT_APP_NAME_demo} ] task"
	@echo "make ${ROOT_APP_NAME_demo}Clean                         ~> clean of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}DependImplementation          ~> see dependencies implementation of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}DependReleaseCompileClasspath ~> see dependencies implementation of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}Test                          ~> run demo of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}Debug                         ~> build debug of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}Release                       ~> build release of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}AssembleDebug                 ~> assemble debug of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}AssembleRelease               ~> assemble release of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}InstallDebug                  ~> install debug of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}LaunchDebug                   ~> install debug and launch of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}InstallRelease                ~> install release of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}UninstallAll                  ~> uninstall All of module [ ${ROOT_APP_NAME_demo} ]"
	@echo "make ${ROOT_APP_NAME_demo}LaunchRelease                 ~> install release and launch of module [ ${ROOT_APP_NAME_demo} ]"
	@echo ""