{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsLibcoreTestCases = android_test {
    name = "CtsLibcoreTestCases";
    defaults = ["cts_support_defaults"];
    platform_apis = true;
    static_libs = [
        "apache-harmony-tests"
        "conscrypt-support"
        "conscrypt-tests"
        "core-tests"
        "cts-core-test-runner-axt"
        "mockito-target-minus-junit4"
        "time_zone_distro-tests"
        "time_zone_distro_installer-tests"
    ];
    dex_preopt = {
        enabled = false;
    };
    dxflags = ["--multi-dex"];
    #  Exclude apache harmony tests from coverage instrumentation, since it breaks
    #  the tests of reflection APIs by adding fields and methods to the test classes.
    jacoco = {
        exclude_filter = ["org.apache.harmony.tests.**"];
    };
    optimize = {
        enabled = false;
    };
    jni_libs = [
        "libjavacoretests"
        "libsqlite_jni"
        "libnativehelper_compat_libc++"
        "libc++"
    ];
    #  Include both the 32 and 64 bit versions of libjavacoretests,
    #  where applicable.
    compile_multilib = "both";
    #  This test requires cts-dalvik-host-test-runner to be built to run via Atest.
    host_required = ["cts-dalvik-host-test-runner"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "mts"
        "vts10"
        "general-tests"
    ];
    java_resources = [
        ":libcore-expectations-knownfailures"
        ":libcore-expectations-virtualdeviceknownfailures"
    ];
};

in { inherit CtsLibcoreTestCases; }
