# com.android.library
ROOT_MODULE_ndkmodule := ndkmodule

.PHONY: ndkmoduleTasks
ndkmoduleTasks:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):tasks

.PHONY: ndkmoduleClean
ndkmoduleClean:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):clean

.PHONY: ndkmoduleDependImplementation
ndkmoduleDependImplementation:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration implementation

.PHONY: ndkmoduleDependReleaseCompileClasspath
ndkmoduleDependReleaseCompileClasspath:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath

.PHONY: ndkmoduleDependReleaseCompileClasspathForce
ndkmoduleDependReleaseCompileClasspathForce:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath --refresh-dependencies

.PHONY: ndkmoduleTest
ndkmoduleTest:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):test

.PHONY: ndkmoduleTestDebug
ndkmoduleTestDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):testDebugUnitTest

.PHONY: ndkmoduleTestRelease
ndkmoduleTestRelease: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):testReleaseUnitTest

.PHONY: ndkmoduleJacocoReportDebug
ndkmoduleJacocoReportDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):jacocoDebugReport

.PHONY: ndkmoduleJacocoReportRelease
ndkmoduleJacocoReportRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):jacocoReleaseReport

.PHONY: ndkmoduleRelease
ndkmoduleRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):build

.PHONY: ndkmoduleAssembleDebug
ndkmoduleAssembleDebug: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleDebug

.PHONY: ndkmoduleAssembleRelease
ndkmoduleAssembleRelease: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleRelease

.PHONY: ndkmodulePublishToMavenLocal
ndkmodulePublishToMavenLocal:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):publishToMavenLocal
	$(info will publish at $$HOME/.m2/repository)

.PHONY: ndkmodulePublish
ndkmodulePublish:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):publish

.PHONY: ndkmoduleUploadArchives
ndkmoduleUploadArchives: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):uploadArchives

.PHONY: help-ndkmodule
help-ndkmodule:
	@echo "=> ${ROOT_PWD}/${ROOT_MODULE_ndkmodule}/z-ndkmodule.mk : android library module [ $(ROOT_MODULE_ndkmodule) ] task"
	@echo "make $(ROOT_MODULE_ndkmodule)Tasks                         ~> show task of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Clean                         ~> clean of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)DependImplementation          ~> see dependencies implementation of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)DependReleaseCompileClasspath ~> see dependencies implementation of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Test                          ~> run test of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)TestDebug                     ~> run test Debug of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)TestRelease                   ~> run test Release of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)JacocoReportDebug             ~> run report jacoco debug of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)JacocoReportRelease           ~> run report jacoco release of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Release                       ~> build release of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)AssembleDebug                 ~> assemble debug of module [ :$(ROOT_MODULE_ndkmodule):assembleDebug ]"
	@echo "make $(ROOT_MODULE_ndkmodule)AssembleRelease               ~> assemble release of module [ :$(ROOT_MODULE_ndkmodule):assembleRelease ]"
	@echo "make $(ROOT_MODULE_ndkmodule)UploadArchives                ~> module [ :$(ROOT_MODULE_ndkmodule):uploadArchives ] deprecated by at gradle 7.+"
	@echo "make $(ROOT_MODULE_ndkmodule)Publish                       ~> module [ :$(ROOT_MODULE_ndkmodule):publish ] effect at gradle 7.+"
	@echo "make $(ROOT_MODULE_ndkmodule)pluginPublishToMavenLocal     ~> module [ :$(ROOT_MODULE_ndkmodule):publishToMavenLocal ] effect at gradle 7.+"
	@echo ""