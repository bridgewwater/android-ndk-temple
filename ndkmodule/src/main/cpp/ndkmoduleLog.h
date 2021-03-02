//
// Created by sinlov on 2021/3/1.
//

#ifndef ANDROID_NDK_TEMPLE_NDKMODULELOG_H
#define ANDROID_NDK_TEMPLE_NDKMODULELOG_H

#ifdef __cplusplus
extern "C" {
#endif

#include "jni.h"
#include <android/log.h>

#define LOG_TAG "ndkmodule"
#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE, LOG_TAG, __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGF(...) __android_log_print(ANDROID_LOG_FATAL, LOG_TAG, __VA_ARGS__)

#ifdef __DEBUG__
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
#else
#define LOGD(...)
#endif

// write log use as: WRITE_LOG(n2JGetExternalCacheDirPath(env), "-> log: %s\n", "this is log");
#define WRITE_LOG(cache_folder, s, ...) do { \
char *fileStr = (char *) malloc(84); \
sprintf(fileStr, "%s/ndkmodule_log.log", cache_folder); \
FILE *f = fopen(fileStr, "a+"); \
  fprintf(f, s, __VA_ARGS__); \
  fflush(f); \
  fclose(f); \
} while (0)

// use as: WRITE_LOG_PATH_PRINT(n2JGetExternalCacheDirPath(env));
#define WRITE_LOG_PATH_PRINT(cache_folder) do { \
char *fileStr = (char *) malloc(84); \
sprintf(fileStr, "%s/ndkmodule_log.log", cache_folder); \
__android_log_print(ANDROID_LOG_WARN, "WRITE_LOG_PATH", "%s", fileStr);\
} while (0)

// jstring转为char*
char *jstring2cStr(JNIEnv *env, jstring jstr);

// char*转为jstring
jstring cStr2jstring(JNIEnv *env, const char *pat);

// char转为16进制
char *char2Hex(unsigned char c, char *hexValue);

jobject n2JGetApplication(JNIEnv *env);

// 获取当前 app 包名
char *n2JGetPackageName(JNIEnv *env);

// 获取当前 app 缓存文件路径
char *n2JGetExternalCacheDirPath(JNIEnv *env);

#ifdef __cplusplus
};
#endif

#endif //ANDROID_NDK_TEMPLE_NDKMODULELOG_H
