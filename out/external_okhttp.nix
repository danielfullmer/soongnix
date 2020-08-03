{ filegroup, java_library, java_library_static }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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
#

#  The source files that contribute to Android's core library APIs.
okhttp_api_files = filegroup {
    name = "okhttp_api_files";
    #  Use the repackaged version of android as that is what is used by Android core library
    #  APIs.
    srcs = ["repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/**/*.java"];
};

#  non-jarjar'd version of okhttp to compile the tests against
okhttp-nojarjar = java_library {
    name = "okhttp-nojarjar";
    srcs = [
        "android/src/main/java/**/*.java"
        "okhttp/src/main/java/**/*.java"
        "okhttp-urlconnection/src/main/java/**/*.java"
        "okhttp-android-support/src/main/java/**/*.java"
        "okio/okio/src/main/java/**/*.java"
    ];
    exclude_srcs = ["okhttp/src/main/java/com/squareup/okhttp/internal/Platform.java"];

    hostdex = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

okhttp = java_library {
    name = "okhttp";
    srcs = [
        #  Although some of the classes in the android/ directory are already in the correct
        #  package and do not need to be moved to another package they are transformed as they
        #  reference other classes that do require repackaging.
        "repackaged/android/src/main/java/**/*.java"
        "repackaged/okhttp/src/main/java/**/*.java"
        "repackaged/okhttp-urlconnection/src/main/java/**/*.java"
        "repackaged/okhttp-android-support/src/main/java/**/*.java"
        "repackaged/okio/okio/src/main/java/**/*.java"
    ];

    hostdex = true;
    installable = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

#  A guaranteed unstripped version of okhttp.
#  The build system may or may not strip the okhttp jar, but this one will
#  not be stripped. See b/24535627.
okhttp-testdex = java_library {
    name = "okhttp-testdex";
    static_libs = ["okhttp"];

    installable = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    dex_preopt = {
        enabled = false;
    };
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

okhttp-tests-nojarjar = java_library_static {
    name = "okhttp-tests-nojarjar";
    srcs = [
        "android/test/java/**/*.java"
        "okhttp-android-support/src/test/java/**/*.java"
        "okhttp-testing-support/src/main/java/**/*.java"
        "okhttp-tests/src/test/java/**/*.java"
        "okhttp-urlconnection/src/test/java/**/*.java"
        "okhttp-ws/src/main/java/**/*.java"
        "okhttp-ws-tests/src/test/java/**/*.java"
        "okio/okio/src/test/java/**/*.java"
        "mockwebserver/src/main/java/**/*.java"
        "mockwebserver/src/test/java/**/*.java"
    ];
    #  Exclude test Android currently has problems with due to @Parameterized (requires JUnit 4.11).
    exclude_srcs = ["okhttp-tests/src/test/java/com/squareup/okhttp/WebPlatformUrlTest.java"];

    no_standard_libs = true;
    libs = [
        "core-all"
        "okhttp-nojarjar"
        "junit"
        "conscrypt"
        "bouncycastle-unbundled"
    ];
    system_modules = "core-all-system-modules";

    java_version = "1.7";
};

in { inherit okhttp okhttp-nojarjar okhttp-testdex okhttp-tests-nojarjar okhttp_api_files; }
