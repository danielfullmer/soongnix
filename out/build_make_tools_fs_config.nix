{ bootstrap_go_package, cc_binary_host, cc_library_headers, genrule, prebuilt_etc, target_fs_config_gen_filegroup }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

soong-fs_config = bootstrap_go_package {
    name = "soong-fs_config";
    pkgPath = "android/soong/fs_config";
    deps = [
        "soong-android"
        "soong-genrule"
    ];
    srcs = [
        "fs_config.go"
    ];
    pluginFor = ["soong_build"];
};

fs_config = cc_binary_host {
    name = "fs_config";
    srcs = ["fs_config.c"];
    shared_libs = [
        "libcutils"
        "libselinux"
    ];
    cflags = ["-Werror"];
};

target_fs_config_gen = target_fs_config_gen_filegroup {
    name = "target_fs_config_gen";
};

oemaids_header_gen = genrule {
    name = "oemaids_header_gen";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) oemaid --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["generated_oem_aid.h"];
};

oemaids_headers = cc_library_headers {
    name = "oemaids_headers";
    generated_headers = ["oemaids_header_gen"];
    export_generated_headers = ["oemaids_header_gen"];
};

#  Generate the vendor/etc/passwd text file for the target
#  This file may be empty if no AIDs are defined in
#  TARGET_FS_CONFIG_GEN files.
passwd_gen = genrule {
    name = "passwd_gen";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --required-prefix=vendor_ --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd = prebuilt_etc {
    name = "passwd";
    vendor = true;
    src = ":passwd_gen";
};

#  Generate the vendor/etc/group text file for the target
#  This file may be empty if no AIDs are defined in
#  TARGET_FS_CONFIG_GEN files.
group_gen = genrule {
    name = "group_gen";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --required-prefix=vendor_ --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group = prebuilt_etc {
    name = "group";
    vendor = true;
    src = ":group_gen";
};

in { inherit fs_config group group_gen oemaids_header_gen oemaids_headers passwd passwd_gen soong-fs_config target_fs_config_gen; }
