{ android_test_helper_app }:
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

VtsAgentApp = android_test_helper_app {
    name = "VtsAgentApp";

    srcs = [
        "src/com/google/android/vts/VtsAgentApp.java"
        "src/com/google/android/vts/VtsAgentAppNative.java"
    ];
    jni_libs = ["libvts_agent_app_jni"];
    sdk_version = "current";

    compile_multilib = "both";

    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit VtsAgentApp; }
