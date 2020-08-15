{ android_library }:
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

live-channels-partner-support = android_library {
    name = "live-channels-partner-support";
    srcs = [
        "src/com/google/android/tv/partner/support/BaseCustomization.java"
        "src/com/google/android/tv/partner/support/EpgContract.java"
        "src/com/google/android/tv/partner/support/EpgInput.java"
        "src/com/google/android/tv/partner/support/EpgInputs.java"
        "src/com/google/android/tv/partner/support/Lineup.java"
        "src/com/google/android/tv/partner/support/Lineups.java"
        "src/com/google/android/tv/partner/support/PartnerCustomizations.java"
        "src/com/google/android/tv/partner/support/TunerSetupUtils.java"
    ];

    sdk_version = "system_current";
    min_sdk_version = "23";

    resource_dirs = ["res"];

    static_libs = ["android-support-annotations"];

    libs = ["tv-auto-value-jar"];

    plugins = ["tv-auto-value"];

};

in { inherit live-channels-partner-support; }
