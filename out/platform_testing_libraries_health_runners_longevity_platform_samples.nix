{ android_test, java_genrule }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

sample-profile-text-protos = java_genrule {
    name = "sample-profile-text-protos";
    host_supported = true;
    tools = ["aprotoc"];
    srcs = [
        ":profile-proto-def"
        "assets/sample_indexed_profile.textpb"
        "assets/sample_scheduled_profile.textpb"
    ];
    out = ["sample-profiles.jar"];
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

LongevityPlatformLibSamples = android_test {
    name = "LongevityPlatformLibSamples";
    min_sdk_version = "24";
    static_libs = [
        "androidx.test.runner"
        "common-platform-scenarios"
        "guava"
        "longevity-device-lib"
        "platform-test-composers"
        "sample-profile-text-protos"
    ];
    srcs = [
        "src/android/platform/test/longevity/samples/SimpleProfile.java"
        "src/android/platform/test/longevity/samples/SimpleSuite.java"
    ];
};

in { inherit LongevityPlatformLibSamples sample-profile-text-protos; }
