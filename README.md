# android-ndk-temple

for android temple of project write as ndk

repo: [https://github.com/bridgewwater/android-ndk-temple](https://github.com/bridgewwater/android-ndk-temple)

## env

> max `jdk version 1.17`, `android studio 2024`

| item                           | version      |
|:-------------------------------|:-------------|
| jdk                            | 1.17+        |
| ndk                            | 22.0.7026061 |
| gradle                         | 7.2+         |
| com.android.tools.build:gradle | 7.1.3        |
| android studio                 | 2021+        |
| android build tools            | 30.0.5       |
| android compile sdk            | 30           |
| android min sdk                | 24           |
| android target sdk             | 26           |

- library version

| item                           | version    |
|:-------------------------------|:-----------|
| androidx.multidex:multidex     | 2.0.1      |
| androidx.appcompat:appcompat   | 1.2.0      |
| com.google.dagger:dagger       | 2.3.2      |
| com.google.dagger:hilt-android | 2.32-alpha |

- test library version

| item                        | version |
|:----------------------------|:--------|
| junit:junit                 | 4.13.2  |
| androidx.test:core          | 1.5.0   |
| org.robolectric:robolectric | 4.10.3  |

more version see [config.gradle](config.gradle)

## dev

task

```bash
# see help
make help
# init project
make init
# check dependency
make dep
# run ci
make ci
```

## warning

application use [view binding](https://developer.android.com/topic/libraries/view-binding)

if can not found databinding class, just use `File -> Invalidate Caches / Just Restart`

## module debug

- press `Run` -> click `Edit Configurations`
- enter `Run/Debug Configurations`
- choose want debug module, and to config pager `Debugger`
- select `Debug type:` to `Dual (Java + Native)`
    - or select `Debug type:` to `Native`

## module

### ndkmodule

```bash
./gradlew ndkmodule:clean ndkmodule:assembleRelease
```

- out aar tree

```bash
Archive:  ndkmodule/build/outputs/aar/ndkmodule-release.aar
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  02-01-1980 00:00   R.txt
      369  02-01-1980 00:00   AndroidManifest.xml
     2059  02-01-1980 00:00   classes.jar
        0  02-01-1980 00:00   jni/
        0  02-01-1980 00:00   jni/arm64-v8a/
   206904  02-01-1980 00:00   jni/arm64-v8a/libndkmodule-lib.so
        0  02-01-1980 00:00   jni/armeabi-v7a/
   104028  02-01-1980 00:00   jni/armeabi-v7a/libndkmodule-lib.so
       44  02-01-1980 00:00   META-INF/com/android/build/gradle/aar-metadata.properties
        0  02-01-1980 00:00   arm64-v8a/
        0  02-01-1980 00:00   armeabi-v7a/
---------                     -------
   313404                     11 files

```

you can search `ndk-setting:` to change ndk settings