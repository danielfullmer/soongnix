{ android_test, cc_defaults, cc_library_shared, java_import, java_library_static }:
let

#  Copyright (C) 2011 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

dexmaker = java_library_static {
    name = "dexmaker";

    #  Include all the java files.
    srcs = ["dexmaker/src/main/java/**/*.java"];

    static_libs = [
        "dexmaker-dx-target"
    ];

    sdk_version = "core_current";
};

#  Build Dexmaker's MockMaker, a plugin to Mockito
dexmaker-mockmaker = java_library_static {
    name = "dexmaker-mockmaker";
    sdk_version = "core_current";
    srcs = ["dexmaker-mockito/src/main/java/**/*.java"];
    java_resource_dirs = ["dexmaker-mockito/src/main/resources"];
    libs = [
        "dexmaker"
        "mockito-api"
    ];
};

#  Build dispatcher for Dexmaker's inline MockMaker
dexmaker-inline-mockmaker-dispatcher = java_library_static {
    name = "dexmaker-inline-mockmaker-dispatcher";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-inline-dispatcher/src/main/java/**/*.java"];
};

#  Defaults for agent code.
dexmaker_agent_defaults = cc_defaults {
    name = "dexmaker_agent_defaults";

    #  Compile with the NDK, so that the agent can be used in apps.
    sdk_version = "current";
    stl = "libc++_static";

    host_supported = false;
    device_supported = true;

    rtti = true;

    cflags = [
        "-std=c++11"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-shift-count-overflow"
        "-Wno-error=non-virtual-dtor"
        "-Wno-sign-compare"
        "-Wno-switch"
        "-Wno-missing-braces"
    ];

    static_libs = [
        "slicer_ndk"
    ];

    shared_libs = [
        "libz"
    ];

    include_dirs = [
        "art/openjdkjvmti/include"
    ];
};

#  Build agent for Dexmaker's inline MockMaker
libdexmakerjvmtiagent = cc_library_shared {
    name = "libdexmakerjvmtiagent";
    defaults = [
        "dexmaker_agent_defaults"
    ];
    srcs = ["dexmaker-mockito-inline/src/main/jni/**/*.cc"];
};

#  Build agent for Dexmaker's extended MockMaker
libstaticjvmtiagent = cc_library_shared {
    name = "libstaticjvmtiagent";
    defaults = [
        "dexmaker_agent_defaults"
    ];
    srcs = ["dexmaker-mockito-inline-extended/src/main/jni/**/*.cc"];
};

#  Build agent for Dexmaker's inline tests
libmultiplejvmtiagentsinterferenceagent = cc_library_shared {
    name = "libmultiplejvmtiagentsinterferenceagent";
    defaults = [
        "dexmaker_agent_defaults"
    ];
    srcs = ["dexmaker-mockito-inline-tests/src/main/jni/**/*.cc"];
};

#  Build Dexmaker's inline MockMaker, a plugin to Mockito
dexmaker-inline-mockmaker = java_library_static {
    name = "dexmaker-inline-mockmaker";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-inline/src/main/java/**/*.java"];
    java_resource_dirs = ["dexmaker-mockito-inline/src/main/resources"];
    libs = [
        "dexmaker"
        "mockito-api"
    ];
    required = ["libdexmakerjvmtiagent"];
};

#  Build Dexmaker's extended MockMaker, a plugin to Mockito
dexmaker-extended-mockmaker = java_library_static {
    name = "dexmaker-extended-mockmaker";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-inline-extended/src/main/java/**/*.java"];

    java_resource_dirs = ["dexmaker-mockito-inline/src/main/resources"];

    libs = [
        "dexmaker"
        "mockito-api"
        "dexmaker-inline-mockmaker"
    ];
    required = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
};

#  Provides mockito functionality for on-device tests. Does not allow stubbing of final or static
#  methods.
mockito-target = java_library_static {
    name = "mockito-target";
    no_framework_libs = true;
    static_libs = [
        "mockito-target-minus-junit4"
        "junit"
    ];
    sdk_version = "core_current";
};

#  Same as mockito-target but does not bundle junit
mockito-target-minus-junit4 = java_library_static {
    name = "mockito-target-minus-junit4";
    no_framework_libs = true;
    static_libs = [
        "mockito"
        "dexmaker"
        "dexmaker-mockmaker"
        "objenesis"
    ];
    libs = ["junit"];
    sdk_version = "core_current";

    java_version = "1.7";
};

#  Provides mockito functionality for on-device tests. Allows stubbing of final methods. Does not
#  allow stubbing of static methods.
#  Project depending on this also need to depend on the static JNI library libdexmakerjvmtiagent
mockito-target-inline = java_library_static {
    name = "mockito-target-inline";
    no_framework_libs = true;
    static_libs = [
        "mockito-target-inline-minus-junit4"
        "junit"
    ];
    sdk_version = "current";
};

#  Same as mockito-target-inline but does not bundle junit
mockito-target-inline-minus-junit4 = java_library_static {
    name = "mockito-target-inline-minus-junit4";
    no_framework_libs = true;
    static_libs = [
        "mockito"
        "dexmaker"
        "dexmaker-inline-mockmaker"
        "objenesis"
    ];
    libs = ["junit"];
    sdk_version = "current";

    java_version = "1.7";
};

#  Provides mockito functionality for on-device tests. Allows stubbing of final and static methods.
#  Stubbing static methods is not an official mockito API.
#  Project depending on this also need to depend on the static JNI libraries libstaticjvmtiagent and
#  libdexmakerjvmtiagent
mockito-target-extended = java_library_static {
    name = "mockito-target-extended";
    no_framework_libs = true;
    static_libs = [
        "mockito-target-extended-minus-junit4"
        "junit"
    ];
    sdk_version = "current";
};

#  Same as mockito-target-extended but does not bundle junit
mockito-target-extended-minus-junit4 = java_library_static {
    name = "mockito-target-extended-minus-junit4";
    no_framework_libs = true;
    static_libs = [
        "mockito"
        "dexmaker"
        "dexmaker-inline-mockmaker"
        "dexmaker-extended-mockmaker"
        "objenesis"
    ];
    libs = ["junit"];
    sdk_version = "current";

    java_version = "1.7";
};

dexmaker-dx-target = java_import {
    name = "dexmaker-dx-target";
    jars = ["lib/dalvik-dx-9.0.0_r3.jar"];
};

#  dexmaker tests
dexmaker-tests-lib = java_library_static {
    name = "dexmaker-tests-lib";
    sdk_version = "current";
    srcs = ["dexmaker-tests/src/androidTest/java/**/*.java"];

    libs = [
        "androidx.test.rules"
        "dexmaker"
        "junit"
    ];
};

#  dexmaker-mockito tests
dexmaker-mockmaker-tests = java_library_static {
    name = "dexmaker-mockmaker-tests";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-tests/src/main/java/**/*.java"];

    libs = [
        "androidx.test.rules"
        "dexmaker"
        "mockito"
        "junit"
        "dexmaker-mockmaker"
    ];
};

#  dexmaker-mockito-inline tests
dexmaker-inline-mockmaker-tests = java_library_static {
    name = "dexmaker-inline-mockmaker-tests";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-inline-tests/src/main/java/**/*.java"];

    libs = [
        "androidx.test.rules"
        "dexmaker"
        "android-support-v4"
        "mockito"
        "junit"
        "dexmaker-inline-mockmaker"
    ];
};

#  dexmaker-mockito-extended tests
dexmaker-extended-mockmaker-tests = java_library_static {
    name = "dexmaker-extended-mockmaker-tests";
    sdk_version = "current";
    srcs = ["dexmaker-mockito-inline-extended-tests/src/main/java/**/*.java"];

    libs = [
        "androidx.test.rules"
        "dexmaker"
        "android-support-v4"
        "mockito"
        "junit"
        "dexmaker-extended-mockmaker"
    ];
};

/*
 * To run the tests:
 *   atest DexmakerTests
 */

DexmakerTests = android_test {
    name = "DexmakerTests";
    sdk_version = "current";
    static_libs = [
        "dexmaker-tests-lib"
        "dexmaker"
        "androidx.test.rules"
        "junit"
    ];
};

in { inherit DexmakerTests dexmaker dexmaker-dx-target dexmaker-extended-mockmaker dexmaker-extended-mockmaker-tests dexmaker-inline-mockmaker dexmaker-inline-mockmaker-dispatcher dexmaker-inline-mockmaker-tests dexmaker-mockmaker dexmaker-mockmaker-tests dexmaker-tests-lib dexmaker_agent_defaults libdexmakerjvmtiagent libmultiplejvmtiagentsinterferenceagent libstaticjvmtiagent mockito-target mockito-target-extended mockito-target-extended-minus-junit4 mockito-target-inline mockito-target-inline-minus-junit4 mockito-target-minus-junit4; }
