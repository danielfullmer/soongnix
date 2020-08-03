{ cc_binary_host, cc_defaults }:
let

#  Copyright 2017 The Android Open Source Project
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

squashfs-tools_defaults = cc_defaults {
    name = "squashfs-tools_defaults";

    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-D_LARGEFILE_SOURCE"
        "-D_GNU_SOURCE"
        "-Wall"
        "-DCOMP_DEFAULT=\"lz4\""
        "-DGZIP_SUPPORT"
        "-DLZ4_SUPPORT"
        "-DXATTR_SUPPORT"
        "-DXATTR_DEFAULT"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-pointer-arith"
        "-Wno-missing-field-initializers"
        "-Wno-unused-function"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libselinux"
    ];
    static_libs = [
        "liblz4"
        "libz"
    ];
};

mksquashfs = cc_binary_host {
    name = "mksquashfs";

    defaults = ["squashfs-tools_defaults"];

    srcs = [
        "mksquashfs.c"
        "read_fs.c"
        "action.c"
        "swap.c"
        "pseudo.c"
        "compressor.c"
        "sort.c"
        "progressbar.c"
        "read_file.c"
        "info.c"
        "restore.c"
        "process_fragments.c"
        "caches-queues-lists.c"
        "xattr.c"
        "read_xattrs.c"
        "gzip_wrapper.c"
        "android.c"
        "lz4_wrapper.c"
    ];
};

unsquashfs = cc_binary_host {
    name = "unsquashfs";

    defaults = ["squashfs-tools_defaults"];

    srcs = [
        "unsquashfs.c"
        "unsquash-1.c"
        "unsquash-2.c"
        "unsquash-3.c"
        "unsquash-4.c"
        "swap.c"
        "compressor.c"
        "unsquashfs_info.c"
        "read_xattrs.c"
        "unsquashfs_xattr.c"
        "gzip_wrapper.c"
        "android.c"
        "lz4_wrapper.c"
    ];
};

in { inherit mksquashfs squashfs-tools_defaults unsquashfs; }
