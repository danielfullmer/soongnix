{ cc_test }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

vts_mediaProfiles_validate_test = cc_test {
    name = "vts_mediaProfiles_validate_test";
    srcs = [
        "ValidateMediaProfiles.cpp"
    ];
    static_libs = [
        "android.hardware.audio.common.test.utility"
        "libxml2"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    data = [
        ":media_profiles"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
    test_config = "vts_mediaProfiles_validate_test.xml";
};

in { inherit vts_mediaProfiles_validate_test; }
