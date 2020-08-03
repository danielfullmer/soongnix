{ cc_defaults, se_cil_compat_map, se_filegroup }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

selinux_policy_version = cc_defaults {
    name = "selinux_policy_version";
    cflags = ["-DSEPOLICY_VERSION=30"];
};

"26.0.board.compat.map" = se_filegroup {
    name = "26.0.board.compat.map";
    srcs = [
        "compat/26.0/26.0.cil"
    ];
};

"27.0.board.compat.map" = se_filegroup {
    name = "27.0.board.compat.map";
    srcs = [
        "compat/27.0/27.0.cil"
    ];
};

"28.0.board.compat.map" = se_filegroup {
    name = "28.0.board.compat.map";
    srcs = [
        "compat/28.0/28.0.cil"
    ];
};

"26.0.board.ignore.map" = se_filegroup {
    name = "26.0.board.ignore.map";
    srcs = [
        "compat/26.0/26.0.ignore.cil"
    ];
};

"27.0.board.ignore.map" = se_filegroup {
    name = "27.0.board.ignore.map";
    srcs = [
        "compat/27.0/27.0.ignore.cil"
    ];
};

"28.0.board.ignore.map" = se_filegroup {
    name = "28.0.board.ignore.map";
    srcs = [
        "compat/28.0/28.0.ignore.cil"
    ];
};

"26.0.cil" = se_cil_compat_map {
    name = "26.0.cil";
    bottom_half = [":26.0.board.compat.map"];
    top_half = "27.0.cil";
};

"27.0.cil" = se_cil_compat_map {
    name = "27.0.cil";
    bottom_half = [":27.0.board.compat.map"];
    top_half = "28.0.cil";
};

"28.0.cil" = se_cil_compat_map {
    name = "28.0.cil";
    bottom_half = [":28.0.board.compat.map"];
    #  top_half: "29.0.cil",
};

"26.0.ignore.cil" = se_cil_compat_map {
    name = "26.0.ignore.cil";
    bottom_half = [":26.0.board.ignore.map"];
    top_half = "27.0.ignore.cil";
};

"27.0.ignore.cil" = se_cil_compat_map {
    name = "27.0.ignore.cil";
    bottom_half = [":27.0.board.ignore.map"];
    top_half = "28.0.ignore.cil";
};

"28.0.ignore.cil" = se_cil_compat_map {
    name = "28.0.ignore.cil";
    bottom_half = [":28.0.board.ignore.map"];
    #  top_half: "29.0.ignore.cil",
};

in { inherit "26.0.board.compat.map" "26.0.board.ignore.map" "26.0.cil" "26.0.ignore.cil" "27.0.board.compat.map" "27.0.board.ignore.map" "27.0.cil" "27.0.ignore.cil" "28.0.board.compat.map" "28.0.board.ignore.map" "28.0.cil" "28.0.ignore.cil" selinux_policy_version; }
