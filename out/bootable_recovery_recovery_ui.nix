{ cc_library, cc_library_static }:
let

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

librecovery_ui = cc_library {
    name = "librecovery_ui";
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "device.cpp"
        "screen_ui.cpp"
        "ui.cpp"
        "vr_ui.cpp"
        "wear_ui.cpp"
    ];

    export_include_dirs = ["include"];

    static_libs = [
        "libminui"
        "libotautil"
    ];

    shared_libs = [
        "libbase"
        "libpng"
        "libz"
    ];
};

#  Generic device that uses ScreenRecoveryUI.
librecovery_ui_default = cc_library_static {
    name = "librecovery_ui_default";
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "default_device.cpp"
    ];

    export_include_dirs = ["include"];
};

#  The default wear device that uses WearRecoveryUI.
librecovery_ui_wear = cc_library_static {
    name = "librecovery_ui_wear";
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "wear_device.cpp"
    ];

    export_include_dirs = ["include"];
};

#  The default VR device that uses VrRecoveryUI.
librecovery_ui_vr = cc_library_static {
    name = "librecovery_ui_vr";
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "vr_device.cpp"
    ];

    export_include_dirs = ["include"];
};

in { inherit librecovery_ui librecovery_ui_default librecovery_ui_vr librecovery_ui_wear; }
