//
// Created by sinlov on 2021/2/8.
//

#include <jni.h>
#include "ndkmodule.h"
#include <android/log.h>
#include <string>
//#include <malloc.h>
#include "ndkmoduleLog.h"

extern "C"
JNIEXPORT jstring JNICALL
Java_com_sinlov_android_ndkmodule_Plugin_sayHello(JNIEnv *env, jobject thiz) {
    std::string hello = "Hello, this from C++";
    LOGV("log: %s", "VERBOSE");
    LOGD("log: %s", "DEBUG");
    LOGI("log: %s", "INFO");
    LOGW("log: %s", "WARN");
    LOGE("log: %s", "ERROR");
    LOGF("log: %s", "FATAL");
    LOGD("hello: %s", hello.c_str());
    WRITE_LOG_PATH_PRINT(n2JGetExternalCacheDirPath(env));
    WRITE_LOG(n2JGetExternalCacheDirPath(env), "-> log: %s\n", hello.c_str());
    return env->NewStringUTF(hello.c_str());
}
extern "C"
JNIEXPORT jstring JNICALL
Java_com_sinlov_android_ndkmodule_Plugin_version(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(ndkmoduleVersion);
}