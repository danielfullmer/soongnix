{ cc_defaults, cc_library_shared, filegroup }:
let

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

#  The headers module is in frameworks/native/Android.bp.

libandroid_defaults = cc_defaults {
    name = "libandroid_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

libandroid = cc_library_shared {
    name = "libandroid";
    defaults = ["libandroid_defaults"];

    srcs = [
        "asset_manager.cpp"
        "choreographer.cpp"
        "configuration.cpp"
        "hardware_buffer_jni.cpp"
        "input.cpp"
        "looper.cpp"
        "native_activity.cpp"
        "native_window_jni.cpp"
        "net.c"
        "obb.cpp"
        "sensor.cpp"
        "sharedmem.cpp"
        "storage_manager.cpp"
        "surface_control.cpp"
        "surface_texture.cpp"
        "system_fonts.cpp"
        "trace.cpp"
        "thermal.cpp"
    ];

    shared_libs = [
        "liblog"
        "libhidlbase"
        "libcutils"
        "libandroidfw"
        "libinput"
        "libutils"
        "libbinder"
        "libui"
        "libgui"
        "libharfbuzz_ng" #  Only for including hb.h via minikin
        "libsensor"
        "libandroid_runtime"
        "libminikin"
        "libnetd_client"
        "libhwui"
        "libxml2"
        "libEGL"
        "libGLESv2"
        "libpowermanager"
        "android.hardware.configstore@1.0"
        "android.hardware.configstore-utils"
        "libnativedisplay"
    ];

    static_libs = [
        "libstorage"
        "libarect"
    ];

    header_libs = ["libhwui_internal_headers"];

    whole_static_libs = ["libnativewindow"];

    export_static_lib_headers = ["libarect"];

    include_dirs = ["bionic/libc/dns/include"];

    version_script = "libandroid.map.txt";
    stubs = {
        symbol_file = "libandroid.map.txt";
        versions = ["29"];
    };
};

#  Network library.
libandroid_net = cc_library_shared {
    name = "libandroid_net";
    defaults = ["libandroid_defaults"];
    srcs = ["net.c"];

    shared_libs = ["libnetd_client"];

    include_dirs = ["bionic/libc/dns/include"];
};

#  Aidl library for platform compat.
lib-platform-compat-native-api = cc_library_shared {
    name = "lib-platform-compat-native-api";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    aidl = {
        local_include_dirs = ["aidl"];
        export_aidl_headers = true;
    };
    srcs = [
        ":platform-compat-native-aidl"
    ];
    export_include_dirs = ["aidl"];
};

platform-compat-native-aidl = filegroup {
    name = "platform-compat-native-aidl";
    srcs = [
        "aidl/com/android/internal/compat/IPlatformCompatNative.aidl"
    ];
    path = "aidl";
};

in { inherit lib-platform-compat-native-api libandroid libandroid_defaults libandroid_net platform-compat-native-aidl; }
