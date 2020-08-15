{ android_test, java_genrule, java_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

#  TODO(harrytczhang@): Refactor to share command with the similar genrule in samples. See
#  b/119635583 for similar bug.
common-profile-text-protos = java_genrule {
    name = "common-profile-text-protos";
    host_supported = true;
    tools = ["aprotoc"];
    srcs = [
        ":profile-proto-def"
        "assets/scenarios_sample_profile.textpb"
    ];
    out = ["sample-profiles-common.jar"];
    /*
     * Loops over all *.textpb files under assets/ and serializes them into binary protos with
     * ".pb" extension using aprotoc. The generated *.pb files are put under an assets/
     * directory, which gets packed into a .jar file and ends up under the assets/
     * directory in the package, which can then be read with asset manager.
     *
     * If a profile fails to parse, an error is thrown and the build will fail.
     */
    cmd = "out_dir=$$(dirname $(out)) && assets_dir=\"assets\" " +
        "&& mkdir -p $$out_dir/$$assets_dir && src_protos=($(locations assets/*.textpb)) " +
        "&& for file in $\${src_protos[@]} ; do fname=$$(basename $$file) " +
        "&& if ! ($(location aprotoc) --encode=longevity.profile.Configuration " +
        "$(location :profile-proto-def) < $$file > " +
        "$$out_dir/$$assets_dir/$\${fname//.textpb/.pb}) ; then " +
        "echo \"\x1b[0;31mFailed to parse profile $$file. See above for errors.\x1b[0m\" " +
        "&& exit 1 ; fi ; done && jar cf $(out) -C $$(dirname $(out)) $$assets_dir";
};

common-platform-scenario-tests = java_library_static {
    name = "common-platform-scenario-tests";
    sdk_version = "test_current";
    srcs = [
        "src/android/platform/test/scenario/businesscard/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/generic/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/performancelaunch/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/profile/CommonUserProfileTest.java"
        "src/android/platform/test/scenario/sleep/IdleMemoryMicrobenchmarkBase.java"
        "src/android/platform/test/scenario/sleep/IdleSystemServerMemoryMicrobenchmark.java"
        "src/android/platform/test/scenario/sleep/IdleSystemUiMemoryMicrobenchmark.java"
    ];
    libs = [
        "common-platform-scenarios"
        "guava"
        "longevity-device-lib"
        "microbenchmark-device-lib"
        "platform-test-options"
        "platform-test-rules"
    ];
};

PlatformCommonScenarioTests = android_test {
    name = "PlatformCommonScenarioTests";
    min_sdk_version = "24";
    static_libs = [
        "common-platform-scenarios"
        "common-profile-text-protos"
        "guava"
        "handheld-app-helpers"
        "launcher-helper-lib"
        "longevity-device-lib"
        "microbenchmark-device-lib"
        "platform-test-composers"
        "platform-test-options"
        "platform-test-rules"
    ];
    srcs = [
        "src/android/platform/test/scenario/businesscard/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/generic/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/performancelaunch/OpenAppMicrobenchmark.java"
        "src/android/platform/test/scenario/profile/CommonUserProfileTest.java"
        "src/android/platform/test/scenario/sleep/IdleMemoryMicrobenchmarkBase.java"
        "src/android/platform/test/scenario/sleep/IdleSystemServerMemoryMicrobenchmark.java"
        "src/android/platform/test/scenario/sleep/IdleSystemUiMemoryMicrobenchmark.java"
    ];
    test_suites = ["device-tests"];
};

in { inherit PlatformCommonScenarioTests common-platform-scenario-tests common-profile-text-protos; }
