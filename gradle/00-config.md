# package

## notes

- use utils must after setting plugin

## config depend

add `config.gradle` at root of project

```gradle
subprojects {
    apply plugin: 'maven'
    apply plugin: 'idea'

    ext {
        test_depends = [
                "junit:junit"                             : "junit:junit:4.12",
                "androidx.test:core"                      : "androidx.test:core:1.3.0",
                "org.mockito:mockito-core"                : "org.mockito:mockito-core:2.7.22",
                "org.robolectric:robolectric"             : "org.robolectric:robolectric:4.4",
                "org.robolectric:shadows-framework"       : "org.robolectric:shadows-framework:4.4",
                "org.robolectric:shadows-multidex"        : "org.robolectric:shadows-multidex:4.4",
                // deprecated
                "org.robolectric:shadows-support-v4"      : "org.robolectric:shadows-support-v4:3.3.2",
                "org.easymock:easymock"                   : "org.easymock:easymock:4.2",
                "org.powermock:powermock-core"            : "org.powermock:powermock-core:2.0.9",
                "org.powermock:powermock-module-junit4"   : "org.powermock:powermock-module-junit4:2.0.9",
                "org.powermock:powermock-api-easymock"    : "org.powermock:powermock-api-easymock:2.0.9",
                "com.squareup.okhttp3:logging-interceptor": "com.squareup.okhttp3:logging-interceptor:3.8.0@jar",
        ]

        android_test_depends = [
                "androidx.test.ext:junit"                             : "androidx.test.ext:junit:1.1.2",
                "androidx.test.espresso:espresso-core"                : "androidx.test.espresso:espresso-core:3.3.0",
                "com.jayway.android.robotium:robotium-solo"           : "com.jayway.android.robotium:robotium-solo:5.5.4",
                "com.android.support.test.uiautomator:uiautomator-v18": "com.android.support.test.uiautomator:uiautomator-v18:2.1.1",
        ]
        provided_depends = [
        ]
        custom_depends = [
        ]
    }
}
```

> you can add new note of this project dependencies

## Setting depend

`in root build.gradle`

```gradle
apply from: rootProject.file("config.gradle")
```

## use project center dependencies

`after root build.gradle setting` in `module build.gradle`

```gradle
dependencies {
    // test start
    // Junit
    testImplementation test_depends["junit:junit"],
            // Mockito
            test_depends["org.mockito:mockito-core"],
            // Robolectric
            test_depends["org.robolectric:robolectric"],
            test_depends["androidx.test:core"],
            // deprecated
//            test_depends.robolectric_shadows_support_v4,
            // EasyMock
            test_depends["org.easymock:easymock"],
            // PowerMock
            test_depends["org.powermock:powermock-core"],
            test_depends["org.powermock:powermock-module-junit4"],
            // PowerMock + EasyMock extension
            test_depends["org.powermock:powermock-api-easymock"]

    androidTestImplementation android_test_depends["androidx.test.ext:junit"],
            android_test_depends["androidx.test.espresso:espresso-core"]

    //    androidTestImplementation android_test_depends.robotium_solo
    // test end
```

## add new dependencies

in node of `config.gradle`

```gradle
...
        custom_depends = [
            "com.my.group:mylib" : "com.my.group:mylib:1.0.0",
        ]
...
```

in use of depends

```gradle
    implementation custom_depends["com.my.group:mylib"]
```