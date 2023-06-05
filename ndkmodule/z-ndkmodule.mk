# com.android.library
ROOT_MODULE_ndkmodule := ndkmodule

ndkmoduleTasks:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):tasks

ndkmoduleClean:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):clean

ndkmoduleDependImplementation:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration implementation

ndkmoduleDependReleaseCompileClasspath:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath

ndkmoduleDependReleaseCompileClasspathForce:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):dependencies --configuration releaseCompileClasspath --refresh-dependencies

ndkmoduleTest:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):test

ndkmoduleTestDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):testDebugUnitTest

ndkmoduleTestRelease: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):testReleaseUnitTest

ndkmoduleJacocoReportDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_plugin):jacocoDebugReport

ndkmoduleJacocoReportRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_plugin):jacocoReleaseReport

ndkmoduleRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):build

ndkmoduleAssembleDebug: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleDebug

ndkmoduleAssembleRelease: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleRelease

ndkmodulePublishToMavenLocal:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_plugin):publishToMavenLocal
	$(info will publish at $$HOME/.m2/repository)

ndkmodulePublish:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_plugin):publish

ndkmoduleUploadArchives: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):uploadArchives

help-ndkmodule:
	@echo "=> ${ROOT_PWD}/${ROOT_MODULE_ndkmodule}/z-ndkmodule.mk : android library module [ $(ROOT_MODULE_ndkmodule) ] task"
	@echo "make $(ROOT_MODULE_plugin)Tasks                         ~> show task of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)Clean                         ~> clean of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)DependImplementation          ~> see dependencies implementation of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)DependReleaseCompileClasspath ~> see dependencies implementation of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)Test                          ~> run test of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)TestDebug                     ~> run test Debug of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)TestRelease                   ~> run test Release of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)JacocoReportDebug             ~> run report jacoco debug of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)JacocoReportRelease           ~> run report jacoco release of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)Release                       ~> build release of module [ $(ROOT_MODULE_plugin) ]"
	@echo "make $(ROOT_MODULE_plugin)AssembleDebug                 ~> assemble debug of module [ :$(ROOT_MODULE_plugin):assembleDebug ]"
	@echo "make $(ROOT_MODULE_plugin)AssembleRelease               ~> assemble release of module [ :$(ROOT_MODULE_plugin):assembleRelease ]"
	@echo "make $(ROOT_MODULE_plugin)UploadArchives                ~> module [ :$(ROOT_MODULE_plugin):uploadArchives ] deprecated by at gradle 7.+"
	@echo "make $(ROOT_MODULE_plugin)Publish                       ~> module [ :$(ROOT_MODULE_plugin):publish ] effect at gradle 7.+"
	@echo "make $(ROOT_MODULE_plugin)pluginPublishToMavenLocal     ~> module [ :$(ROOT_MODULE_plugin):publishToMavenLocal ] effect at gradle 7.+"
	@echo ""