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
    vendor_available = true;
    generated_headers = ["oemaids_header_gen"];
    export_generated_headers = ["oemaids_header_gen"];
};

#  Generate the */etc/passwd text files for the target
#  These files may be empty if no AIDs are defined in
#  TARGET_FS_CONFIG_GEN files.
passwd_gen_system = genrule {
    name = "passwd_gen_system";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --partition=system --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd_system = prebuilt_etc {
    name = "passwd_system";
    filename = "passwd";
    src = ":passwd_gen_system";
};

passwd_gen_vendor = genrule {
    name = "passwd_gen_vendor";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --partition=vendor --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd_vendor = prebuilt_etc {
    name = "passwd_vendor";
    filename = "passwd";
    vendor = true;
    src = ":passwd_gen_vendor";
};

passwd_gen_odm = genrule {
    name = "passwd_gen_odm";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --partition=odm --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd_odm = prebuilt_etc {
    name = "passwd_odm";
    filename = "passwd";
    device_specific = true;
    src = ":passwd_gen_odm";
};

passwd_gen_product = genrule {
    name = "passwd_gen_product";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --partition=product --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd_product = prebuilt_etc {
    name = "passwd_product";
    filename = "passwd";
    product_specific = true;
    src = ":passwd_gen_product";
};

passwd_gen_system_ext = genrule {
    name = "passwd_gen_system_ext";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) passwd --partition=system_ext --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["passwd"];
};

passwd_system_ext = prebuilt_etc {
    name = "passwd_system_ext";
    filename = "passwd";
    system_ext_specific = true;
    src = ":passwd_gen_system_ext";
};

#  Generate the */etc/group text files for the target
#  These files may be empty if no AIDs are defined in
#  TARGET_FS_CONFIG_GEN files.
group_gen_system = genrule {
    name = "group_gen_system";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --partition=system --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group_system = prebuilt_etc {
    name = "group_system";
    filename = "group";
    src = ":group_gen_system";
};

group_gen_vendor = genrule {
    name = "group_gen_vendor";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --partition=vendor --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group_vendor = prebuilt_etc {
    name = "group_vendor";
    filename = "group";
    vendor = true;
    src = ":group_gen_vendor";
};

group_gen_odm = genrule {
    name = "group_gen_odm";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --partition=odm --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group_odm = prebuilt_etc {
    name = "group_odm";
    filename = "group";
    device_specific = true;
    src = ":group_gen_odm";
};

group_gen_product = genrule {
    name = "group_gen_product";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --partition=product --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group_product = prebuilt_etc {
    name = "group_product";
    filename = "group";
    product_specific = true;
    src = ":group_gen_product";
};

group_gen_system_ext = genrule {
    name = "group_gen_system_ext";
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) group --partition=system_ext --aid-header=$(location :android_filesystem_config_header) $(locations :target_fs_config_gen) >$(out)";
    srcs = [
        ":target_fs_config_gen"
        ":android_filesystem_config_header"
    ];
    out = ["group"];
};

group_system_ext = prebuilt_etc {
    name = "group_system_ext";
    filename = "group";
    system_ext_specific = true;
    src = ":group_gen_system_ext";
};

in { inherit fs_config group_gen_odm group_gen_product group_gen_system group_gen_system_ext group_gen_vendor group_odm group_product group_system group_system_ext group_vendor oemaids_header_gen oemaids_headers passwd_gen_odm passwd_gen_product passwd_gen_system passwd_gen_system_ext passwd_gen_vendor passwd_odm passwd_product passwd_system passwd_system_ext passwd_vendor soong-fs_config target_fs_config_gen; }
