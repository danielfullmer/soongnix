{ java_library }:
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

app-helpers-common-interfaces = java_library {
    name = "app-helpers-common-interfaces";
    libs = ["ub-uiautomator"];
    static_libs = ["app-helpers-core"];
    srcs = ["common/**/*.java"];
    sdk_version = "test_current";
};

# #####################################

app-helpers-auto-interfaces = java_library {
    name = "app-helpers-auto-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
        "androidx.test.runner"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = [
        "auto/**/*.java"
        "handheld/**/INotificationHelper.java"
    ];
    sdk_version = "test_current";
};

# #####################################

app-helpers-clockwork-interfaces = java_library {
    name = "app-helpers-clockwork-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = ["clockwork/**/*.java"];
    sdk_version = "test_current";
};

# #####################################

app-helpers-handheld-interfaces = java_library {
    name = "app-helpers-handheld-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = ["handheld/**/*.java"];
    sdk_version = "test_current";
};

# #####################################

app-helpers-tv-interfaces = java_library {
    name = "app-helpers-tv-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
        "launcher-helper-lib"
    ];
    static_libs = [
        "app-helpers-common-interfaces"
        "dpad-util"
    ];
    srcs = ["tv/**/*.java"];
    sdk_version = "test_current";
};

in { inherit app-helpers-auto-interfaces app-helpers-clockwork-interfaces app-helpers-common-interfaces app-helpers-handheld-interfaces app-helpers-tv-interfaces; }
