{ android_app }:
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

LatinIME = android_app {
    name = "LatinIME";

    srcs = ["src/**/*.java"];

    certificate = "shared";

    jni_libs = ["libjni_latinime"];

    static_libs = [
        "android-common"
        "jsr305"
        "latinime-common"
        "androidx.legacy_legacy-support-v4"
    ];

    #  Do not compress dictionary files to mmap dict data runtime
    aaptflags = ["-0 .dict"];

    #  Include all the resources regardless of system supported locales
    aapt_include_all_resources = true;

    min_sdk_version = "14";
    target_sdk_version = "23";
    sdk_version = "current";

    product_specific = true;

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit LatinIME; }
