{ cc_binary_host, cc_defaults, cc_prebuilt_binary }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

sepolicy_tools_defaults = cc_defaults {
    name = "sepolicy_tools_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = ["libsepol"];
    stl = "none";
};

checkseapp = cc_binary_host {
    name = "checkseapp";
    defaults = ["sepolicy_tools_defaults"];
    srcs = ["check_seapp.c"];
    whole_static_libs = ["libpcre2"];
    cflags = ["-DLINK_SEPOL_STATIC"];
};

checkfc = cc_binary_host {
    name = "checkfc";
    defaults = ["sepolicy_tools_defaults"];
    srcs = ["checkfc.c"];
    static_libs = ["libselinux"];
};

sepolicy-check = cc_binary_host {
    name = "sepolicy-check";
    defaults = ["sepolicy_tools_defaults"];
    srcs = ["sepolicy-check.c"];
};

version_policy = cc_binary_host {
    name = "version_policy";
    defaults = ["sepolicy_tools_defaults"];
    srcs = ["version_policy.c"];
};

"insertkeys.py" = cc_prebuilt_binary {
    name = "insertkeys.py";
    srcs = ["insertkeys.py"];
    host_supported = true;
};

in { inherit "insertkeys.py" checkfc checkseapp sepolicy-check sepolicy_tools_defaults version_policy; }
