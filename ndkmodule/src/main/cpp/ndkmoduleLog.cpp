//
// Created by sinlov on 2021/3/1.
//

#include <malloc.h>
#include "jni.h"
#include <string>
#include "ndkmoduleLog.h"

#define HEX_VALUES "0123456789ABCDEF"

char *jstring2cStr(JNIEnv *env, jstring jstr) {
    const char *temp = (char *) env->GetStringUTFChars(jstr, NULL);
    char *ret = (char *) malloc(strlen(temp) + 1);
    strcpy(ret, temp);
    env->ReleaseStringUTFChars(jstr, temp);
    return ret;
}

jstring cStr2jstring(JNIEnv *env, const char *chars) {
    jstring ret = env->NewStringUTF(chars);
    return ret;
}


char *char2Hex(unsigned char c, char *hexValue) {
    if (c < 16) {
        hexValue[0] = HEX_VALUES[0];
        hexValue[1] = HEX_VALUES[c];
    } else {
        int l = c / 16;
        int r = c % 16;
        hexValue[0] = HEX_VALUES[l];
        hexValue[1] = HEX_VALUES[r];
    }
    hexValue[2] = 0;
    return hexValue;
}

jobject n2JGetApplication(JNIEnv *env) {
    jclass localClass = env->FindClass( "android/app/ActivityThread");
    if (localClass != nullptr) {
        jmethodID getApplication = env->GetStaticMethodID(localClass, "currentApplication",
                                                          "()Landroid/app/Application;");
        if (getApplication != nullptr) {
            jobject application = env->CallStaticObjectMethod(localClass, getApplication);
            return application;
        }
        return nullptr;
    }
    return nullptr;
}

char *n2JGetPackageName(JNIEnv *env) {
    jobject context = n2JGetApplication(env);
    if (context == nullptr) {
        LOGW("n2JGetPackageName: not found context, return null");
        return nullptr;
    }
    jclass activity = env->GetObjectClass(context);
    jmethodID methodID_pack = env->GetMethodID(activity, "getPackageName", "()Ljava/lang/String;");
    auto name_str = static_cast<jstring>(env->CallObjectMethod(context, methodID_pack));
    return jstring2cStr(env, name_str);
}

char *n2JGetExternalCacheDirPath(JNIEnv *env) {
    jobject context = n2JGetApplication(env);
    if (context == nullptr) {
        LOGW("n2JGetExternalCacheDirPath: not found context, return null");
        return nullptr;
    }
    jclass activity = env->GetObjectClass(context);
    jmethodID methodID_externalCacheDir = env->GetMethodID(activity, "getExternalCacheDir", "()Ljava/io/File;");
    jobject getExternalCacheDirObj = env->CallObjectMethod(context, methodID_externalCacheDir);
    jclass getExternalCacheDirClass = env->GetObjectClass(getExternalCacheDirObj);
    jmethodID methodID_AbsolutePath = env->GetMethodID(getExternalCacheDirClass, "getAbsolutePath", "()Ljava/lang/String;");
    auto dir_str = static_cast<jstring>(env->CallObjectMethod(getExternalCacheDirObj, methodID_AbsolutePath));
    return jstring2cStr(env, dir_str);
}