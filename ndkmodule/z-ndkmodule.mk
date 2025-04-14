# com.android.library
ROOT_MODULE_ndkmodule := ndkmodule

.PHONY: ndkmoduleTasks
ndkmoduleTasks:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):tasks

.PHONY: ndkmoduleClean
ndkmoduleClean:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):clean

.PHONY: ndkmoduleDependImplementation
ndkmoduleDependImplementation:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):dependencies --configuration implementation

.PHONY: ndkmoduleDependReleaseCompileClasspath
ndkmoduleDependReleaseCompileClasspath:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath

.PHONY: ndkmoduleDependReleaseCompileClasspathForce
ndkmoduleDependReleaseCompileClasspathForce:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath --refresh-dependencies

.PHONY: ndkmoduleTest
ndkmoduleTest:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):test

.PHONY: ndkmoduleTestDebug
ndkmoduleTestDebug:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):testDebugUnitTest

.PHONY: ndkmoduleTestRelease
ndkmoduleTestRelease: ndkmoduleClean
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):testReleaseUnitTest

.PHONY: ndkmoduleJacocoReportDebug
ndkmoduleJacocoReportDebug:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):jacocoDebugReport

.PHONY: ndkmoduleJacocoReportRelease
ndkmoduleJacocoReportRelease:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):jacocoReleaseReport

.PHONY: ndkmoduleRelease
ndkmoduleRelease:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):build

.PHONY: ndkmoduleAssembleDebug
ndkmoduleAssembleDebug: ndkmoduleClean
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):assembleDebug

.PHONY: ndkmoduleAssembleRelease
ndkmoduleAssembleRelease: ndkmoduleClean
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):assembleRelease

.PHONY: ndkmodulePublishToMavenLocal
ndkmodulePublishToMavenLocal:
	$(info "-> this task effect at gradle 7.+")
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):publishToMavenLocal
ifeq ($(OS),Windows_NT)
	$(info will publish at: $$env:USERPROFILE\.m2\repository)
else
	$(info will publish at: $$HOME/.m2/repository)
endif


.PHONY: ndkmodulePublish
ndkmodulePublish:
	${ENV_GRADLE_WRAPPER_EXEC} -q $(ROOT_MODULE_ndkmodule):publish

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
	@echo "make $(ROOT_MODULE_ndkmodule)Publish                       ~> module [ :$(ROOT_MODULE_ndkmodule):publish ] effect at gradle 7.+"
	@echo "make $(ROOT_MODULE_ndkmodule)PublishToMavenLocal           ~> module [ :$(ROOT_MODULE_plugin):publishToMavenLocal ] effect at gradle 7.+"
	@echo ""