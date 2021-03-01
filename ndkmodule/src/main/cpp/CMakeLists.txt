# Warning: this setting of DANDROID_PLATFORM will inoperative
#add_definitions(-DANDROID_PLATFORM=android-21)

# auto add define of __DEBUG__
IF (CMAKE_BUILD_TYPE STREQUAL Debug)
    ADD_DEFINITIONS(-D__DEBUG__)
ENDIF()
# force add define of __DEBUG__
#ADD_DEFINITIONS(-D__DEBUG__)

# native library minimum CMake version
cmake_minimum_required(VERSION 3.4.1)

find_library( # Sets the name of the path variable.
        log-lib
        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log )

# add one libraray (if now more lib use write more add_library)
add_library(# name of lib
            ndkmodule-lib
            # set lib of shared, final buil out will be elf, file suffix is .so
            SHARED

            # specifies the relative path to the source file
        ndkmoduleLog.cpp
        ndkmodule.cpp)
target_link_libraries( # Specifies the target library.
        ndkmodule-lib

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib} )
# for use #include <xx>
#include_directories( imported-lib/include/ )

# set target lib, properties, import path, target path
#set_target_properties(
#        ndkmodule-lib
#        PROPERTIES
#        IMPORTED_LOCATION
#        ${CMAKE_SOURCE_DIR}/src/${ANDROID_ABI}/ndkmodule-lib.so )

# warning before Android 6.0, native-lib is final name of build
#target_link_libraries(native-lib ndkmodule-lib)

#set command [ source ], variable is the variable argument that follows
#set(source a b c)
#message(${source})

# for different abi
#set(ANDROID_ABI "areambi-v7a")
#if(${ANDROID_ABI} STREQUAL "areambi")
#    message("armv5")
#elseif(${ANDROID_ABI} STREQUAL "areambi-v7a")
#    message("armv7a")
#else()
#
#endif()
