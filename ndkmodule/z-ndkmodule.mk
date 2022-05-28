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

ndkmoduleDebug:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):buildDebug

ndkmoduleRelease:
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):build

ndkmoduleAssembleDebug: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleDebug

ndkmoduleAssembleRelease: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):assembleRelease

ndkmoduleUploadArchives: ndkmoduleClean
	$(ROOT_PWD)/gradlew -q $(ROOT_MODULE_ndkmodule):uploadArchives

help-ndkmodule:
	@echo "=> ${ROOT_PWD}/${ROOT_MODULE_ndkmodule}/z-ndkmodule.mk : android library module [ $(ROOT_MODULE_ndkmodule) ] task"
	@echo "make $(ROOT_MODULE_ndkmodule)Tasks                         ~> show task of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Clean                         ~> clean of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)DependImplementation          ~> see dependencies implementation of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)DependReleaseCompileClasspath ~> see dependencies implementation of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Test                          ~> run test of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)TestDebug                     ~> run test Debug of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)TestRelease                   ~> run test Release of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Debug                         ~> build debug of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)Release                       ~> build release of module [ $(ROOT_MODULE_ndkmodule) ]"
	@echo "make $(ROOT_MODULE_ndkmodule)AssembleDebug                 ~> assemble debug of module [ :$(ROOT_MODULE_ndkmodule):assembleDebug ]"
	@echo "make $(ROOT_MODULE_ndkmodule)AssembleRelease               ~> assemble release of module [ :$(ROOT_MODULE_ndkmodule):assembleRelease ]"
	@echo "make $(ROOT_MODULE_ndkmodule)UploadArchives                ~> module [ :$(ROOT_MODULE_ndkmodule):uploadArchives ]"
	@echo ""