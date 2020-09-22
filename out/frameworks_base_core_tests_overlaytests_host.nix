{ java_test_host }:
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

OverlayHostTests = java_test_host {
    name = "OverlayHostTests";
    srcs = ["src/com/android/server/om/hosttest/InstallOverlayTests.java"];
    libs = ["tradefed"];
    test_suites = ["general-tests"];
    target_required = [
        "OverlayHostTests_NonPlatformSignatureOverlay"
        "OverlayHostTests_PlatformSignatureStaticOverlay"
        "OverlayHostTests_PlatformSignatureOverlay"
        "OverlayHostTests_UpdateOverlay"
        "OverlayHostTests_FrameworkOverlayV1"
        "OverlayHostTests_FrameworkOverlayV2"
        "OverlayHostTests_AppOverlayV1"
        "OverlayHostTests_AppOverlayV2"
    ];
};

in { inherit OverlayHostTests; }