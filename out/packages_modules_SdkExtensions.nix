{ android_app_certificate, apex, apex_defaults, apex_key, gensrcs, package, prebuilt_etc, python_binary_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

_missingName = package {
    default_visibility = [":__subpackages__"];
};

"com.android.sdkext" = apex {
    name = "com.android.sdkext";
    defaults = ["com.android.sdkext-defaults"];
    binaries = ["derive_sdk"];
    java_libs = ["framework-sdkextensions"];
    prebuilts = ["cur_sdkinfo"];
    manifest = "manifest.json";
    min_sdk_version = "current";
};

"com.android.sdkext-defaults" = apex_defaults {
    name = "com.android.sdkext-defaults";
    updatable = true;
    min_sdk_version = "R";
    prebuilts = [
        "derive_sdk.rc"
    ];
    key = "com.android.sdkext.key";
    certificate = ":com.android.sdkext.certificate";
};

"com.android.sdkext.key" = apex_key {
    name = "com.android.sdkext.key";
    public_key = "com.android.sdkext.avbpubkey";
    private_key = "com.android.sdkext.pem";
};

"com.android.sdkext.certificate" = android_app_certificate {
    name = "com.android.sdkext.certificate";
    certificate = "com.android.sdkext";
};

gen_sdkinfo = python_binary_host {
    name = "gen_sdkinfo";
    srcs = [
        "sdk.proto"
        "gen_sdkinfo.py"
    ];
    proto = {
        canonical_path_from_root = false;
    };
    version = {
        py3 = {
            embedded_launcher = true;
        };
    };
};

cur_sdkinfo_src = gensrcs {
    name = "cur_sdkinfo_src";
    srcs = [""];
    tools = ["gen_sdkinfo"];
    cmd = "$(location) -v 0 -o $(out)";
};

cur_sdkinfo = prebuilt_etc {
    name = "cur_sdkinfo";
    src = ":cur_sdkinfo_src";
    filename = "sdkinfo.binarypb";
    installable = false;
};

in { inherit "com.android.sdkext" "com.android.sdkext-defaults" "com.android.sdkext.certificate" "com.android.sdkext.key" _missingName cur_sdkinfo cur_sdkinfo_src gen_sdkinfo; }
