{ java_library_host, java_library_static }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

platform-test-annotations = java_library_static {
    name = "platform-test-annotations";
    host_supported = true;
    srcs = [
        "src/android/platform/test/annotations/ApiTest.java"
        "src/android/platform/test/annotations/AppModeFull.java"
        "src/android/platform/test/annotations/AppModeInstant.java"
        "src/android/platform/test/annotations/GlobalPresubmit.java"
        "src/android/platform/test/annotations/HermeticTest.java"
        "src/android/platform/test/annotations/Postsubmit.java"
        "src/android/platform/test/annotations/Presubmit.java"
        "src/android/platform/test/annotations/QualityTest.java"
        "src/android/platform/test/annotations/RequiresDevice.java"
        "src/android/platform/test/annotations/RestrictedBuildTest.java"
        "src/android/platform/test/annotations/RootPermissionTest.java"
        "src/android/platform/test/annotations/SecurityTest.java"
    ];
    sdk_version = "current"; #  To allow use from CTS
};

#  For compatibility with old -host suffix naming
platform-test-annotations-host = java_library_host {
    name = "platform-test-annotations-host";
    static_libs = ["platform-test-annotations"];
};

in { inherit platform-test-annotations platform-test-annotations-host; }
