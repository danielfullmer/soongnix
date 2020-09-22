{ cc_defaults, file_contexts, filegroup, hwservice_contexts, prebuilt_etc, property_contexts, se_cil_compat_map, se_filegroup, service_contexts }:
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

"29.0.board.compat.map" = se_filegroup {
    name = "29.0.board.compat.map";
    srcs = [
        "compat/29.0/29.0.cil"
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

"29.0.board.ignore.map" = se_filegroup {
    name = "29.0.board.ignore.map";
    srcs = [
        "compat/29.0/29.0.ignore.cil"
    ];
};

"plat_26.0.cil" = se_cil_compat_map {
    name = "plat_26.0.cil";
    stem = "26.0.cil";
    bottom_half = [":26.0.board.compat.map"];
    top_half = "plat_27.0.cil";
};

"plat_27.0.cil" = se_cil_compat_map {
    name = "plat_27.0.cil";
    stem = "27.0.cil";
    bottom_half = [":27.0.board.compat.map"];
    top_half = "plat_28.0.cil";
};

"plat_28.0.cil" = se_cil_compat_map {
    name = "plat_28.0.cil";
    stem = "28.0.cil";
    bottom_half = [":28.0.board.compat.map"];
    top_half = "plat_29.0.cil";
};

"plat_29.0.cil" = se_cil_compat_map {
    name = "plat_29.0.cil";
    stem = "29.0.cil";
    bottom_half = [":29.0.board.compat.map"];
    #  top_half: "plat_30.0.cil",
};

"system_ext_26.0.cil" = se_cil_compat_map {
    name = "system_ext_26.0.cil";
    stem = "26.0.cil";
    bottom_half = [":26.0.board.compat.map"];
    top_half = "system_ext_27.0.cil";
    system_ext_specific = true;
};

"system_ext_27.0.cil" = se_cil_compat_map {
    name = "system_ext_27.0.cil";
    stem = "27.0.cil";
    bottom_half = [":27.0.board.compat.map"];
    top_half = "system_ext_28.0.cil";
    system_ext_specific = true;
};

"system_ext_28.0.cil" = se_cil_compat_map {
    name = "system_ext_28.0.cil";
    stem = "28.0.cil";
    bottom_half = [":28.0.board.compat.map"];
    top_half = "system_ext_29.0.cil";
    system_ext_specific = true;
};

"system_ext_29.0.cil" = se_cil_compat_map {
    name = "system_ext_29.0.cil";
    stem = "29.0.cil";
    bottom_half = [":29.0.board.compat.map"];
    #  top_half: "system_ext_30.0.cil",
    system_ext_specific = true;
};

"product_26.0.cil" = se_cil_compat_map {
    name = "product_26.0.cil";
    stem = "26.0.cil";
    bottom_half = [":26.0.board.compat.map"];
    top_half = "product_27.0.cil";
    product_specific = true;
};

"product_27.0.cil" = se_cil_compat_map {
    name = "product_27.0.cil";
    stem = "27.0.cil";
    bottom_half = [":27.0.board.compat.map"];
    top_half = "product_28.0.cil";
    product_specific = true;
};

"product_28.0.cil" = se_cil_compat_map {
    name = "product_28.0.cil";
    stem = "28.0.cil";
    bottom_half = [":28.0.board.compat.map"];
    top_half = "product_29.0.cil";
    product_specific = true;
};

"product_29.0.cil" = se_cil_compat_map {
    name = "product_29.0.cil";
    stem = "29.0.cil";
    bottom_half = [":29.0.board.compat.map"];
    #  top_half: "product_30.0.cil",
    product_specific = true;
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
    top_half = "29.0.ignore.cil";
};

"29.0.ignore.cil" = se_cil_compat_map {
    name = "29.0.ignore.cil";
    bottom_half = [":29.0.board.ignore.map"];
    #  top_half: "30.0.ignore.cil",
};

"26.0.compat.cil" = prebuilt_etc {
    name = "26.0.compat.cil";
    src = "private/compat/26.0/26.0.compat.cil";
    sub_dir = "selinux/mapping";
};

"27.0.compat.cil" = prebuilt_etc {
    name = "27.0.compat.cil";
    src = "private/compat/27.0/27.0.compat.cil";
    sub_dir = "selinux/mapping";
};

"28.0.compat.cil" = prebuilt_etc {
    name = "28.0.compat.cil";
    src = "private/compat/28.0/28.0.compat.cil";
    sub_dir = "selinux/mapping";
};

"29.0.compat.cil" = prebuilt_etc {
    name = "29.0.compat.cil";
    src = "private/compat/29.0/29.0.compat.cil";
    sub_dir = "selinux/mapping";
};

file_contexts_files = se_filegroup {
    name = "file_contexts_files";
    srcs = ["file_contexts"];
};

file_contexts_asan_files = se_filegroup {
    name = "file_contexts_asan_files";
    srcs = ["file_contexts_asan"];
};

file_contexts_overlayfs_files = se_filegroup {
    name = "file_contexts_overlayfs_files";
    srcs = ["file_contexts_overlayfs"];
};

hwservice_contexts_files = se_filegroup {
    name = "hwservice_contexts_files";
    srcs = ["hwservice_contexts"];
};

property_contexts_files = se_filegroup {
    name = "property_contexts_files";
    srcs = ["property_contexts"];
};

service_contexts_files = se_filegroup {
    name = "service_contexts_files";
    srcs = ["service_contexts"];
};

plat_file_contexts = file_contexts {
    name = "plat_file_contexts";
    srcs = [":file_contexts_files"];
    product_variables = {
        address_sanitize = {
            srcs = [":file_contexts_asan_files"];
        };
        debuggable = {
            srcs = [":file_contexts_overlayfs_files"];
        };
    };

    flatten_apex = {
        srcs = ["apex/*-file_contexts"];
    };

    recovery_available = true;
};

vendor_file_contexts = file_contexts {
    name = "vendor_file_contexts";
    srcs = [":file_contexts_files"];
    soc_specific = true;
    recovery_available = true;
};

system_ext_file_contexts = file_contexts {
    name = "system_ext_file_contexts";
    srcs = [":file_contexts_files"];
    system_ext_specific = true;
    recovery_available = true;
};

product_file_contexts = file_contexts {
    name = "product_file_contexts";
    srcs = [":file_contexts_files"];
    product_specific = true;
    recovery_available = true;
};

odm_file_contexts = file_contexts {
    name = "odm_file_contexts";
    srcs = [":file_contexts_files"];
    device_specific = true;
    recovery_available = true;
};

plat_hwservice_contexts = hwservice_contexts {
    name = "plat_hwservice_contexts";
    srcs = [":hwservice_contexts_files"];
};

system_ext_hwservice_contexts = hwservice_contexts {
    name = "system_ext_hwservice_contexts";
    srcs = [":hwservice_contexts_files"];
    system_ext_specific = true;
};

product_hwservice_contexts = hwservice_contexts {
    name = "product_hwservice_contexts";
    srcs = [":hwservice_contexts_files"];
    product_specific = true;
};

vendor_hwservice_contexts = hwservice_contexts {
    name = "vendor_hwservice_contexts";
    srcs = [":hwservice_contexts_files"];
    reqd_mask = true;
    soc_specific = true;
};

odm_hwservice_contexts = hwservice_contexts {
    name = "odm_hwservice_contexts";
    srcs = [":hwservice_contexts_files"];
    device_specific = true;
};

plat_property_contexts = property_contexts {
    name = "plat_property_contexts";
    srcs = [":property_contexts_files"];
    recovery_available = true;
};

system_ext_property_contexts = property_contexts {
    name = "system_ext_property_contexts";
    srcs = [":property_contexts_files"];
    system_ext_specific = true;
    recovery_available = true;
};

product_property_contexts = property_contexts {
    name = "product_property_contexts";
    srcs = [":property_contexts_files"];
    product_specific = true;
    recovery_available = true;
};

vendor_property_contexts = property_contexts {
    name = "vendor_property_contexts";
    srcs = [":property_contexts_files"];
    reqd_mask = true;
    soc_specific = true;
    recovery_available = true;
};

odm_property_contexts = property_contexts {
    name = "odm_property_contexts";
    srcs = [":property_contexts_files"];
    device_specific = true;
    recovery_available = true;
};

plat_service_contexts = service_contexts {
    name = "plat_service_contexts";
    srcs = [":service_contexts_files"];
};

system_ext_service_contexts = service_contexts {
    name = "system_ext_service_contexts";
    srcs = [":service_contexts_files"];
    system_ext_specific = true;
};

product_service_contexts = service_contexts {
    name = "product_service_contexts";
    srcs = [":service_contexts_files"];
    product_specific = true;
};

vendor_service_contexts = service_contexts {
    name = "vendor_service_contexts";
    srcs = [":service_contexts_files"];
    reqd_mask = true;
    soc_specific = true;
};

#  For vts_treble_sys_prop_test
public_property_contexts = filegroup {
    name = "public_property_contexts";
    srcs = ["public/property_contexts"];
    visibility = [
        "//test/vts-testcase/security/system_property"
    ];
};

in { inherit "26.0.board.compat.map" "26.0.board.ignore.map" "26.0.compat.cil" "26.0.ignore.cil" "27.0.board.compat.map" "27.0.board.ignore.map" "27.0.compat.cil" "27.0.ignore.cil" "28.0.board.compat.map" "28.0.board.ignore.map" "28.0.compat.cil" "28.0.ignore.cil" "29.0.board.compat.map" "29.0.board.ignore.map" "29.0.compat.cil" "29.0.ignore.cil" "plat_26.0.cil" "plat_27.0.cil" "plat_28.0.cil" "plat_29.0.cil" "product_26.0.cil" "product_27.0.cil" "product_28.0.cil" "product_29.0.cil" "system_ext_26.0.cil" "system_ext_27.0.cil" "system_ext_28.0.cil" "system_ext_29.0.cil" file_contexts_asan_files file_contexts_files file_contexts_overlayfs_files hwservice_contexts_files odm_file_contexts odm_hwservice_contexts odm_property_contexts plat_file_contexts plat_hwservice_contexts plat_property_contexts plat_service_contexts product_file_contexts product_hwservice_contexts product_property_contexts product_service_contexts property_contexts_files public_property_contexts selinux_policy_version service_contexts_files system_ext_file_contexts system_ext_hwservice_contexts system_ext_property_contexts system_ext_service_contexts vendor_file_contexts vendor_hwservice_contexts vendor_property_contexts vendor_service_contexts; }
